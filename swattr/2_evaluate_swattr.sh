mkdir -p ../results/swattr/bigbluebutton ../results/swattr/jabref ../results/swattr/mediastore ../results/swattr/teastore ../results/swattr/teammates 
mkdir -p ../results/swattr/bigbluebutton-historic ../results/swattr/jabref-historic ../results/swattr/mediastore-historic ../results/swattr/teastore-historic ../results/swattr/teammates-historic

python eval.py -g ../benchmark/bigbluebutton/text_2021/goldstandard.csv -t ../results/swattr-raw/bigbluebutton/ -o ../results/swattr/bigbluebutton/swattr-raw.csv -m 12 -x ../benchmark/bigbluebutton/text_2021/bigbluebutton.txt
python eval.py -g ../benchmark/bigbluebutton/text_2015/goldstandard.csv -t ../results/swattr-raw/bigbluebutton-historic/ -o ../results/swattr/bigbluebutton-historic/swattr-raw.csv -m 12 -x ../benchmark/bigbluebutton/text_2015/bigbluebutton_2015.txt
python eval.py -g ../benchmark/jabref/text_2021/goldstandard.csv -t ../results/swattr-raw/jabref/ -o ../results/swattr/jabref/swattr-raw.csv -m 6 -x ../benchmark/jabref/text_2021/jabref.txt
python eval.py -g ../benchmark/jabref/text_2016/goldstandard.csv -t ../results/swattr-raw/jabref-historic/ -o ../results/swattr/jabref-historic/swattr-raw.csv -m 6 -x ../benchmark/jabref/text_2016/jabref_2016.txt
python eval.py -g ../benchmark/mediastore/text_2016/goldstandard.csv -t ../results/swattr-raw/mediastore/ -o ../results/swattr/mediastore/swattr-raw.csv -m 14 -x ../benchmark/mediastore/text_2016/mediastore.txt
python eval.py -g ../benchmark/mediastore/text_2011/goldstandard.csv -t swattr-raw/mediastore-historic/ -o ../results/swattr/mediastore-historic/swattr-raw.csv -m 14 -x ../benchmark/mediastore/text_2011/mediastore_2011.txt
python eval.py -g ../benchmark/teammates/text_2021/goldstandard.csv -t swattr-raw/teammates/ -o ../results/swattr/teammates/swattr-raw.csv -m 8 -x ../benchmark/teammates/text_2021/teammates.txt
python eval.py -g ../benchmark/teammates/text_2015/goldstandard.csv -t swattr-raw/teammates-historic/ -o ../results/swattr/teammates-historic/swattr-raw.csv -m 8 -x ../benchmark/teammates/text_2015/teammates_2015.txt
python eval.py -g ../benchmark/teastore/text_2020/goldstandard.csv -t swattr-raw/teastore/ -o ../results/swattr/teastore/swattr-raw.csv -m 11 -x ../benchmark/teastore/text_2020/teastore.txt
python eval.py -g ../benchmark/teastore/text_2018/goldstandard_AB.csv -t swattr-raw/teastore-historic/ -o ../results/swattr/teastore-historic/swattr-raw.csv -m 11 -x ../benchmark/teastore/text_2018/teastore_2018_AB.txt
