#!/usr/bin/env python3
import sys
import os
import argparse
from typing import List

import pandas as pd
from sklearn.metrics import recall_score, precision_score, confusion_matrix, fbeta_score, f1_score
import numpy as np


class Config(dict):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set(self, key, val):
        self[key] = val
        setattr(self, key, val)


config = Config(
    header=0,
    delimiter=',',
    names=['modelElementID', 'sentence', 'confidence'],
    comment_char='#'
)

config_gold = Config(
    header=0,
    delimiter=',',
    names=['modelElementID', 'sentence'],
    comment_char='#'
)


def load_data_gold(filename):
    try:
        df = pd.read_csv(filename, delimiter=config_gold.delimiter, header=config_gold.header, encoding='utf8',
                         names=config_gold.names, comment=config_gold.comment_char)
    except pd.errors.ParserError as e:
        print('Error in loading gold file. Skipping ' + filename)
        return None
    if 'confidence' in df.columns:
        df = df.drop(['confidence'], axis=1)
    df = df.dropna()
    df = df.drop_duplicates()
    df = df.sort_index()
    return df


def load_data(filename):
    try:
        df = pd.read_csv(filename, delimiter=config.delimiter, header=config.header, encoding='utf8',
                         names=config.names, comment=config.comment_char)
    except pd.errors.ParserError as e:
        print('Error in loading test file. Skipping ' + filename)
        return None
    if 'confidence' in df.columns:
        df = df.drop(['confidence'], axis=1)
    df = df.dropna()
    df = df.drop_duplicates()
    df = df.sort_index()
    return df


def compare(gold_set, test_set):
    # calculate, where there are commons and differences between the answer set and the gold set
    # merge both and add the indicator 'comp' that tells us, if a row is present in both (TP), left_only (FP), or right_only (FN)
    compare_df = pd.merge(test_set, gold_set, how='outer', indicator='comp')
    y_pred = []
    y_true = []

    for entry in compare_df['comp']:
        if entry == 'both':
            y_pred.append(1)
            y_true.append(1)
        elif entry == 'left_only':
            y_pred.append(1)
            y_true.append(0)
        elif entry == 'right_only':
            y_pred.append(0)
            y_true.append(1)

    cm = confusion_matrix(y_true, y_pred)
    return (y_pred, y_true, cm)


def calculate_precision(y_true, y_pred):
    return precision_score(y_true, y_pred, average='binary')


def calculate_recall(y_true, y_pred):
    return recall_score(y_true, y_pred, average='binary')


def calculate_fbeta(y_true, y_pred, beta=1):
    return fbeta_score(y_true, y_pred, beta, average='binary')


def calculate_f1(y_true, y_pred):
    return f1_score(y_true, y_pred, average='binary')


def get_matrix(cm, all_combinations: int):
    tp = cm[1][1]
    fp = cm[0][1]
    fn = cm[1][0]
    # (count * #model)-tp-fp-fn
    tn = all_combinations - tp - fp - fn
    return tp, fp, fn, tn


def calculate_accuracy(cm, all_combinations: int):
    tp, fp, fn, tn = get_matrix(cm, all_combinations)
    return (tp + tn) / (tp + tn + fp + fn)


def calculate_specificity(cm, all_combinations):
    tp, fp, fn, tn = get_matrix(cm, all_combinations)
    return tn / (tn + fp)


def calculate_phi(cm, all_combinations):
    tp, fp, fn, tn = get_matrix(cm, all_combinations)

    numerator = (tp * tn) - (fp * fn)
    denominator = np.sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn))
    return numerator / denominator


def print_confusion_matrix(cm):
    print('Confusion Matrix: \n')
    print('\t\tGold')
    print('\t\tPos\t| Neg')
    print('Pred\tPos\t' + str(cm[1][1]) + '\t  ' + str(cm[0][1]))
    print('\tNeg\t' + str(cm[1][0]) + '\t  ' + str(cm[0][0]))
    print('')


def evaluate(gold_set, test_set, all_combinations: int):
    (y_pred, y_true, cm) = compare(gold_set, test_set)

    if verbose:
        print_confusion_matrix(cm)

    precision = calculate_precision(y_true=y_true, y_pred=y_pred)
    recall = calculate_recall(y_true=y_true, y_pred=y_pred)
    f1 = calculate_f1(y_true=y_true, y_pred=y_pred)

    acc = calculate_accuracy(cm=cm, all_combinations=all_combinations)
    spec = calculate_specificity(cm=cm, all_combinations=all_combinations)
    phi = calculate_phi(cm=cm, all_combinations=all_combinations)

    if verbose:
        print('Precision:\t' + str(precision))
        print('Recall:\t\t' + str(recall))
        print('F1-Score:\t' + str(f1))
        print('Accuracy:\t' + str(acc))
        print('Specificity:\t' + str(spec))
        print('PhiCoef:\t' + str(phi))

        print('')

    return (precision, recall, f1, acc, spec, phi)


def count_true_negatives(text: str):
    non_blank_count = 0
    with open(text) as file:
        for line in file:
            if line.strip():
                non_blank_count += 1

    if verbose:
        print(f"Found {non_blank_count} sentences in {text}")
    return non_blank_count


def process(args):
    gold_set = load_data_gold(args.gold)
    all_combinations = count_true_negatives(args.text) * int(args.elementcount)

    save_header(args.output)

    if os.path.isfile(args.test) and args.test.endswith('.csv'):
        process_single(gold_set=gold_set, test_file=args.test, all_combinations=all_combinations, out_file=args.output)
    elif os.path.isdir(args.test):
        listing = [os.path.join(dp, f) for dp, dn, fn in os.walk(os.path.expanduser(args.test)) for f in fn]
        for test_file in listing:
            if test_file.endswith('.csv'):
                try:
                    process_single(gold_set=gold_set, test_file=test_file, all_combinations=all_combinations,
                                   out_file=args.output)
                except Exception as e:
                    print('Skipping ' + test_file + '. It is an invalid CSV file')
            else:
                print('Skipping ' + test_file + '. It is no CSV-file')
    else:
        print('Error, could not process test input as it is neither filer nor directory')


def process_single(gold_set, test_file, all_combinations: int, out_file):
    test_set = load_data(test_file)
    if test_set is None:
        return
    if verbose:
        print(test_file)
    (precision, recall, f1, acc, spec, phi) = evaluate(gold_set=gold_set, test_set=test_set,
                                                       all_combinations=all_combinations)
    result_string = '{}; {}; {}; {}; {}; {}; {}'.format(test_file, precision, recall, f1, acc, spec, phi)
    if not verbose:
        print(result_string)
    save_results(out_file, result_string)


def save_results(file, result_string):
    if file is None:
        return
    f = open(file, 'a')
    f.write(result_string)
    f.write('\n')
    f.close()


def save_header(file):
    if file is None:
        return
    f = open(file, 'w')
    f.write('file; precision; recall; f1; acc; spec; phi\n')
    f.close()


def init_argparser():
    parser = argparse.ArgumentParser()
    parser.add_argument("-g", "--gold", help="Path to the gold standard")
    parser.add_argument("-t", "--test", help="Path to the test results. Can either be a file or folder")
    parser.add_argument("-x", "--text", help="Path to the text to calculate TNs")
    parser.add_argument("-m", "--elementcount", help="Amount of Model Elements for TNs")

    parser.add_argument("-v", "--verbose", default=False, action="store_true", help="Verbose output")
    parser.add_argument("-o", "--output",
                        help="File where the output should be saved to. If not set, output will not be saved to file. CARE: Overwrites existing files!")

    return parser


verbose = False
if __name__ == "__main__":
    parser = init_argparser()
    args = parser.parse_args()

    verbose = args.verbose

    process(args)
