# ReplicationPackage_ICSA23

Replication package for the ICSA 2023 paper "Detecting Inconsistencies in Software Architecture Documentation Using
Traceability Link Recovery".

**You find the overall results and comparison to baseline and old approach in [results.xlsx](./results/results.xlsx)**

For replication, you need to have installed ...

* Java JDK 17
* Python 3.10.6 with pip
* Maven or an IDE that is able to deal with Maven Projects (e.g., IntelliJ)

## Blacklists for MME Detection
We use a common black list and project-specific blacklists to filter unwanted words.

The [common blacklist](./approach/inconsistency-detection/src/main/resources/unwanted_words_filter_common.json) contains: cpu, gpu, file, directory, event, bus, browser, chrome, firefox, safari, edge, instance, object, module, code, java, javascript, nodejs, npm, kotlin, request, response, servlet, unit, test.

The project-specific blacklists are:
* [MediaStore](./approach/tests/src/test/resources/configurations/ms/filterlists_all.txt): download,file,log,meta,server
* [TeaStore](./approach/tests/src/test/resources/configurations/ts/filterlists_all.txt): instance,item,name,product,rankings,rating,size
* [TEAMMATES](./approach/tests/src/test/resources/configurations/tm/filterlists_all.txt): assertion,backdoor,check,classes,code,cron,end,failure,javascript,key,limit,minute,origin,processing,queue,request,servlet,task,testing,unit,utility,origin
* [BigBlueButton](./approach/tests/src/test/resources/configurations/bbb/filterlists_all.txt): conversion,core,cpu,file,front,integration,nodejs,party,process,side,svg
* [JabRef](./approach/tests/src/test/resources/configurations/jabref/filterlists_all.txt): aspect,bibdatases,bibentries,bus,event

## SWATTR

To generate the results for SWATTR go to the `swattr` directory and follow the instructions in the directory.

## TLR Baseline

To get the results for the TLR Baseline approach simply run the JUnit Test
Class [EvaluationIT](./tlr-baseline/src/test/java/io/github/ardoco/simpletracelinkdiscovery/eval/EvaluationIT.java).
Therefore, you have to install Java 17 and import the project to an IDE of your choice (we suggest IntelliJ or Eclipse
here).

## Our Approach for TLR and ID & Baseline for ID

To generate the results of our approach including the baseline of inconsistency detection (ID) you find everything in
the directory `approach`.
To get the results for our approach for TLR and ID you have to run certain JUnit Tests:

* [TraceabilityLinkRecoveryEvaluationIT](approach/tests/src/test/java/edu/kit/kastel/mcse/ardoco/core/tests/integration/TraceabilityLinkRecoveryEvaluationIT.java)
    * `evaluateTraceLinkRecoveryIT`: Runs the TLR for non-historic project texts
    * `evaluateHistoricalDataTraceLinkRecoveryIT`: Runs the TLR for historic project texts

* [InconsistencyDetectionEvaluationIT](approach/tests/src/test/java/edu/kit/kastel/mcse/ardoco/core/tests/integration/InconsistencyDetectionEvaluationIT.java)

    * `missingModelElementInconsistencyIT`: Runs the Missing Model Element ID for non-historic project texts
    * `missingModelElementInconsistencyHistoricIT`: Runs the Missing Model Element ID for historic project texts

    * `missingModelElementInconsistencyBaselineIT`: Runs the Missing Model Element ID of the baseline approach
    * `missingModelElementInconsistencyBaselineHistoricIT`: Runs the Missing Model Element ID of historic project texts
      with the baseline approach

    * `missingTextInconsistencyIT`: Runs the undocumented model element ID on non-historic project texts
    * `missingTextInconsistencyHistoricIT`: Runs the undocumented model element ID on historic project texts

If you want to change the filters for Missing Model Element ID, you have to change the filter file
in [Projects](approach/tests/src/test/java/edu/kit/kastel/mcse/ardoco/core/tests/eval/Project.java). In this
enumeration, the different options for filtering are listed in comments for the different projects.
The common filter is defined in [unwanted_words_filter_common.json](approach/inconsistency-detection/src/main/resources/unwanted_words_filter_common.json). The project specific configurations can be found in [configurations](approach/tests/src/test/resources/configurations).
