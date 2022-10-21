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
```
python eval.py -g ../case_studies/mediastore/gold_standard/Eval_Ecsa_MediaStore.csv -t results_swattr/mediastore/ -o eval_results/mediastore/ours.csv -m 12 -x ../case_studies/mediastore/text/Palladio_MediaStore_Text.txt 

python eval.py -g ../case_studies/teastore/gold_standards/Eval_Ecsa_TeaStore.csv -t results_swattr/teaStore/ -o eval_results/teastore/ours.csv -m 11 -x ../case_studies/teastore/text/EcsaText.txt 

python eval.py -g ../case_studies/teammates/gold_standard/Goldstandard_Teammates.csv -t results_swattr/teammates/ -o eval_results/teammates/ours.csv -m 8 -x ../case_studies/teammates/text/TeammatesForEvalText.txt 