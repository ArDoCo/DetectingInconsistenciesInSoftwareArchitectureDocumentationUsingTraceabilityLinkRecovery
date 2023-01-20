#!/bin/bash
rm -rf ../results/swattr && rm -rf ../results/swattr-raw
rm -rf ../approach/tests/src/test/resources/testout && mkdir -p ../approach/tests/src/test/resources/testout

cd ../tlr-baseline
mvn clean

cd ../approach
mvn clean

cd ../run_scripts
