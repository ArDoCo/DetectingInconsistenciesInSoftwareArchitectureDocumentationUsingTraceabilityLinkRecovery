## Steps to Reproduce
0. Download and Install JDK 17
1. Download SWATTR by executing [0_get_swattr.sh](0_get_swattr.sh) within this directory
2. Run swattr to create results: Run [1_run_swattr.sh](1_run_swattr.sh) within this directory
3. Create python environment: 
   * `python -m venv .venv`
   * Windows: `.\.venv\Scripts\Activate.ps1` or Linux: `source ./.venv/bin/activate`
   * `pip3 install -r requirements.txt` 

4. Run swattr evaluation: Run [2_evaluate_swattr.sh](2_evaluate_swattr.sh) within this directory
