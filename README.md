# ReplicationPackage_ICSA23
Replication package for the ICSA 2023 paper "Detecting Inconsistencies in Software Architecture Documentation Using Traceability Link Recovery" by Keim et al.

## Steps to Reproduce
0. Download and Install JDK 17
1. Download SWATTR by executing [get_swattr.sh](swattr/get_swattr.sh) within the swattr directory
2. Run swattr to create results: [run_swattr.sh](swattr/run_swattr.sh) within the swattr directory
3. Run eval.py


Run with the following command(s)

`python eval.py -g PATH_TO_GOLD -t PATH_TO_RESULT_CSV_FOLDER -x PATH_TO_TEXT -m MODEL_ELEMENT_COUNT -o OUTPUTNAME`


For example:
```bash
mkdir -p eval_results/bigbluebutton eval_results/jabref eval_results/mediastore eval_results/teastore eval_results/teammates
python eval.py -g ./benchmark/bigbluebutton/text_2021/goldstandard.csv -t results_swattr/bigbluebutton/ -o eval_results/bigbluebutton/swattr.csv -m 12 -x ./benchmark/bigbluebutton/text_2021/bigbluebutton.txt
python eval.py -g ./benchmark/jabref/text_2021/goldstandard.csv -t results_swattr/jabref/ -o eval_results/jabref/swattr.csv -m 6 -x ./benchmark/jabref/text_2021/jabref.txt
python eval.py -g ./benchmark/mediastore/text_2016/goldstandard.csv -t results_swattr/mediastore/ -o eval_results/mediastore/swattr.csv -m 14 -x ./benchmark/mediastore/text_2016/mediastore.txt 
python eval.py -g ./benchmark/teastore/text_2020/goldstandard.csv -t results_swattr/teastore/ -o eval_results/teastore/swattr.csv -m 11 -x ./benchmark/teastore/text_2020/teastore.txt 
python eval.py -g ./benchmark/teammates/text_2021/goldstandard.csv -t results_swattr/teammates/ -o eval_results/teammates/swattr.csv -m 8 -x ./benchmark/teammates/text_2021/teammates.txt 
```