# SWATTR Reproduction

## Steps to Reproduce our results with SWATTR
0. Download and Install JDK 17
1. Download SWATTR by running the commands in [0_get_swattr.sh](0_get_swattr.sh) within this directory
2. Run SWATTR to create raw results: Run [1_run_swattr.sh](1_run_swattr.sh) within this directory
3. Create python environment or directly install requirements for evaluation: 
   * `python -m venv .venv`
   * Windows: `.\.venv\Scripts\Activate.ps1` or Linux: `source ./.venv/bin/activate`
   * `pip3 install -r requirements.txt` 

4. Run evaluation of SWATTR: Run [2_evaluate_swattr.sh](2_evaluate_swattr.sh) within this directory. The results can be found in [results](../results)
