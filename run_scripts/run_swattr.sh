#!/bin/bash
cd ../swattr
curl -sS https://bootstrap.pypa.io/get-pip.py | python3
bash 0_get_swattr.sh
bash 1_run_swattr.sh
pip3 install -r requirements.txt
bash 2_evaluate_swattr.sh
echo "Results can be found in the results folder (in the parent directory)"
cd ../run_scripts
