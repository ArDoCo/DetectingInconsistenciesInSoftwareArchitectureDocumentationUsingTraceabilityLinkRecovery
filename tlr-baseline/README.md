# SimpleTracelinkDiscovery
Simple Tracelink Discovery (STD) is a simple approach for Traceability Link Recovery. Its intended use is for linking informal textual software architecture documentation and software architecture models, i.e., PCM.

## Basic Functionality
STD calculates trace links between a software documentation and a model by matching the model entity names and its n-grams with words and n-grams in the documentation lines.

For instance, for the entity ``AutomatedActionFactory``, the matches of  *"automatedactionfactory", "automated action", "action factory" and "automated action factory"* in each documentation line are counted. If the number of matches exceeds a certain threshold (match number threshold), a trace link between this entity and the corresponding documentation line is created.

For string comparison to match n-grams or entity names, the Levenshtein Distance is used with a simple normalization to the range [0,1].
If this value is greater than or equal to a defined similarity threshold, a match is counted. A threshold of 1.0 means that both strings or n-grams must be identical. Cases are always ignored.
Analogously, the Jaro-Winkler Similarity can be used instead of the normalized Levenshtein Distance.

## Evaluation Results
We evaluated the traceability link recovery on five open source projects. See also [ArDoCo/Benchmark](https://github.com/ArDoCo/Benchmark).
The table below shows the results with a match count threshold of 1 and a similarity threshold of 0.9 for the normalized Levenshtein Distance.

| Project | precision | recall | f1-score |
| - | - | - | - |
| Media Store | 1.000 | 0.383 | 0.554 |
| TeaStore | 0.882 | 0.357 | 0.508 |
| TEAMMATES | 0.759 | 0.451 | 0.566 |
| BigBlueButton | 0.375 | 0.148 | 0.212 |
| JabRef | 0.867 | 0.419 | 0.565 |
