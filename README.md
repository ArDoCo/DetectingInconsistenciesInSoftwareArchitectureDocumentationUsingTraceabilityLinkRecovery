# ReplicationPackage_ICSA23

Replication package for the ICSA 2023 paper "Detecting Inconsistencies in Software Architecture Documentation Using
Traceability Link Recovery" by Keim et al.

In general, you need to have installed ...

* Java JDK 17
* Python 3.10.6 with pip
* Maven or an IDE that is able to deal with Maven Projects (e.g., IntelliJ)

## SWATTR

To generate the results for SWATTR go to the `swattr` directory and follow the instructions in the directory.

## TLR Baseline

To get the results for the TLR Baseline approach simply run the JUnit Test
Class [EvaluationIT](./tlr-baseline/src/test/java/io/github/ardoco/simpletracelinkdiscovery/eval/EvaluationIT.java)
Therefore, you have to install Java 17 and import the project to an IDE of your choice (we suggest IntelliJ or Eclipse
here).

## Our Approach for TLR and ID & Baseline for ID

To generate the results of our approach including the baseline of inconsistency detection (ID) you find everything in
the directory `our-approach`
To get the results for our approach for TLR and ID you have to run certain JUnit Tests

* [TraceabilityLinkRecoveryEvaluationIT](our-approach/tests/src/test/java/edu/kit/kastel/mcse/ardoco/core/tests/integration/TraceabilityLinkRecoveryEvaluationIT.java)
    * `evaluateTraceLinkRecoveryIT`: Runs the TLR for non-historic project texts
    * `evaluateHistoricalDataTraceLinkRecoveryIT`: Tuns the TLR for historic project texts

* [InconsistencyDetectionEvaluationIT](our-approach/tests/src/test/java/edu/kit/kastel/mcse/ardoco/core/tests/integration/InconsistencyDetectionEvaluationIT.java)

    * `missingModelElementInconsistencyIT`: Runs the Missing Model Element ID for non-historic project texts
    * `missingModelElementInconsistencyHistoricIT`: Runs the Missing Model Element ID for historic project texts

    * `missingModelElementInconsistencyBaselineIT`: Runs the Missing Model Element ID of the baseline approach
    * `missingModelElementInconsistencyBaselineHistoricIT`: Runs the Missing Model Element ID of historic project texts
      with the baseline approach

    * `missingTextInconsistencyIT`: Runs the undocumented model element ID on non-historic project texts
    * `missingTextInconsistencyHistoricIT`: Runs the undocumented model element ID on historic project texts

If you want to change the filters for Missing Model Element ID, you have to change the filter file
in [Projects](our-approach/tests/src/test/java/edu/kit/kastel/mcse/ardoco/core/tests/eval/Project.java). In this
enumeration, the different options for filtering are listed in comments for the different projects.