mkdir -p ../results/swattr-raw
java -jar ardoco-core-pipeline.jar -c config.txt -n BigBlueButton -m owl/bbb.repository.owl -t ../benchmark/bigbluebutton/text_2021/bigbluebutton.txt -o ../results/swattr-raw/bigbluebutton
java -jar ardoco-core-pipeline.jar -c config.txt -n BigBlueButton -m owl/bbb.repository.owl -t ../benchmark/bigbluebutton/text_2015/bigbluebutton_2015.txt -o ../results/swattr-raw/bigbluebutton-historic
java -jar ardoco-core-pipeline.jar -c config.txt -n JabRef -m owl/jabref.repository.owl -t ../benchmark/jabref/text_2021/jabref.txt -o ../results/swattr-raw/jabref
java -jar ardoco-core-pipeline.jar -c config.txt -n JabRef -m owl/jabref.repository.owl -t ../benchmark/jabref/text_2016/jabref_2016.txt -o ../results/swattr-raw/jabref-historic
java -jar ardoco-core-pipeline.jar -c config.txt -n Mediastore -m owl/mediastore.repository.owl -t ../benchmark/mediastore/text_2016/mediastore.txt -o ../results/swattr-raw/mediastore
java -jar ardoco-core-pipeline.jar -c config.txt -n TEAMMATES -m owl/teammates.repository.owl -t ../benchmark/teammates/text_2021/teammates.txt -o ../results/swattr-raw/teammates
java -jar ardoco-core-pipeline.jar -c config.txt -n TEAMMATES -m owl/teammates.repository.owl -t ../benchmark/teammates/text_2015/teammates_2015.txt -o ../results/swattr-raw/teammates-historic
java -jar ardoco-core-pipeline.jar -c config.txt -n TeaStore -m owl/teastore.repository.owl -t ../benchmark/teastore/text_2020/teastore.txt -o ../results/swattr-raw/teastore
java -jar ardoco-core-pipeline.jar -c config.txt -n TeaStore -m owl/teastore.repository.owl -t ../benchmark/teastore/text_2018/teastore_2018_AB.txt -o ../results/swattr-raw/teastore-historic
