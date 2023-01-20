#!/bin/bash
cd ../approach
export testHistoric=true
export testBaseline=true
mvn verify
cd ../run_scripts
