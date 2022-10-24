java -jar ardoco-core-pipeline.jar -c config.txt -n BigBlueButton -m owl/bbb.repository.owl -t ../benchmark/bigbluebutton/text_2021/bigbluebutton.txt -o ../results_swattr/bigbluebutton
java -jar ardoco-core-pipeline.jar -c config.txt -n BigBlueButton -m owl/bbb.repository.owl -t ../benchmark/bigbluebutton/text_2015/bigbluebutton_2015.txt -o ../results_swattr/bigbluebutton-historic
java -jar ardoco-core-pipeline.jar -c config.txt -n JabRef -m owl/jabref.repository.owl -t ../benchmark/jabref/text_2021/jabref.txt -o ../results_swattr/jabref
java -jar ardoco-core-pipeline.jar -c config.txt -n JabRef -m owl/jabref.repository.owl -t ../benchmark/jabref/text_2016/jabref_2016.txt -o ../results_swattr/jabref-historic
java -jar ardoco-core-pipeline.jar -c config.txt -n Mediastore -m owl/mediastore.repository.owl -t ../benchmark/mediastore/text_2016/mediastore.txt -o ../results_swattr/mediastore
java -jar ardoco-core-pipeline.jar -c config.txt -n Mediastore -m owl/mediastore.repository.owl -t ../benchmark/mediastore/text_2011/mediastore_2011.txt -o ../results_swattr/mediastore-historic
java -jar ardoco-core-pipeline.jar -c config.txt -n TEAMMATES -m owl/teammates.repository.owl -t ../benchmark/teammates/text_2021/teammates.txt -o ../results_swattr/teammates
java -jar ardoco-core-pipeline.jar -c config.txt -n TEAMMATES -m owl/teammates.repository.owl -t ../benchmark/teammates/text_2015/teammates_2015.txt -o ../results_swattr/teammates-historic
java -jar ardoco-core-pipeline.jar -c config.txt -n TeaStore -m owl/teastore.repository.owl -t ../benchmark/teastore/text_2020/teastore.txt -o ../results_swattr/teastore
java -jar ardoco-core-pipeline.jar -c config.txt -n TeaStore -m owl/teastore.repository.owl -t ../benchmark/teastore/text_2018/teastore_2018_AB.txt -o ../results_swattr/teastore-historic
