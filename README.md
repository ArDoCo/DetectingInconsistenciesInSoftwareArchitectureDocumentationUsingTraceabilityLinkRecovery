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
mkdir -p eval_results/bigbluebutton-historic eval_results/jabref-historic eval_results/mediastore-historic eval_results/teastore-historic eval_results/teammates-historic
```

```bash
python eval.py -g ./benchmark/bigbluebutton/text_2021/goldstandard.csv -t results_swattr/bigbluebutton/ -o eval_results/bigbluebutton/swattr.csv -m 12 -x ./benchmark/bigbluebutton/text_2021/bigbluebutton.txt
python eval.py -g ./benchmark/bigbluebutton/text_2015/goldstandard.csv -t results_swattr/bigbluebutton-historic/ -o eval_results/bigbluebutton-historic/swattr.csv -m 12 -x ./benchmark/bigbluebutton/text_2015/bigbluebutton_2015.txt

python eval.py -g ./benchmark/jabref/text_2021/goldstandard.csv -t results_swattr/jabref/ -o eval_results/jabref/swattr.csv -m 6 -x ./benchmark/jabref/text_2021/jabref.txt
python eval.py -g ./benchmark/jabref/text_2016/goldstandard.csv -t results_swattr/jabref-historic/ -o eval_results/jabref-historic/swattr.csv -m 6 -x ./benchmark/jabref/text_2016/jabref_2016.txt

python eval.py -g ./benchmark/mediastore/text_2016/goldstandard.csv -t results_swattr/mediastore/ -o eval_results/mediastore/swattr.csv -m 14 -x ./benchmark/mediastore/text_2016/mediastore.txt
python eval.py -g ./benchmark/mediastore/text_2011/goldstandard.csv -t results_swattr/mediastore-historic/ -o eval_results/mediastore-historic/swattr.csv -m 14 -x ./benchmark/mediastore/text_2011/mediastore_2011.txt 

python eval.py -g ./benchmark/teammates/text_2021/goldstandard.csv -t results_swattr/teammates/ -o eval_results/teammates/swattr.csv -m 8 -x ./benchmark/teammates/text_2021/teammates.txt
python eval.py -g ./benchmark/teammates/text_2015/goldstandard.csv -t results_swattr/teammates-historic/ -o eval_results/teammates-historic/swattr.csv -m 8 -x ./benchmark/teammates/text_2015/teammates_2015.txt

python eval.py -g ./benchmark/teastore/text_2020/goldstandard.csv -t results_swattr/teastore/ -o eval_results/teastore/swattr.csv -m 11 -x ./benchmark/teastore/text_2020/teastore.txt
python eval.py -g ./benchmark/teastore/text_2018/goldstandard_AB.csv -t results_swattr/teastore-historic/ -o eval_results/teastore-historic/swattr.csv -m 11 -x ./benchmark/teastore/text_2018/teastore_2018_AB.txt 
```