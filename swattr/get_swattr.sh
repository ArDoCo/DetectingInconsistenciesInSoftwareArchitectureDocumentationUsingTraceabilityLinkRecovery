curl -Lo ardoco-core-pipeline.jar https://github.com/ArDoCo/SWATTR/releases/download/v1.0/ardoco-core-pipeline.jar
mkdir -p owl
curl -Lo owl/mediastore.owl https://raw.githubusercontent.com/ArDoCo/SWATTR/main/case_studies/mediastore/models/mediastore.owl
curl -Lo owl/teammates.owl https://raw.githubusercontent.com/ArDoCo/SWATTR/main/case_studies/teammates/model/teammates.owl
curl -Lo owl/teastore.owl https://raw.githubusercontent.com/ArDoCo/SWATTR/main/case_studies/teastore/model/teastore.owl
