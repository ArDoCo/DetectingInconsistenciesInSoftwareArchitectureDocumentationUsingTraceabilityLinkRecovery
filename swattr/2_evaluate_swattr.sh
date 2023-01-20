mkdir -p ../results/swattr/bigbluebutton ../results/swattr/jabref ../results/swattr/mediastore ../results/swattr/teastore ../results/swattr/teammates 
mkdir -p ../results/swattr/bigbluebutton-historic ../results/swattr/jabref-historic ../results/swattr/mediastore-historic ../results/swattr/teastore-historic ../results/swattr/teammates-historic

python3 eval.py -g ../benchmark/bigbluebutton/text_2021/goldstandard.csv -t ../results/swattr-raw/bigbluebutton/ -o ../results/swattr/bigbluebutton/swattr.csv -m 12 -x ../benchmark/bigbluebutton/text_2021/bigbluebutton.txt
python3 eval.py -g ../benchmark/bigbluebutton/text_2015/goldstandard.csv -t ../results/swattr-raw/bigbluebutton-historic/ -o ../results/swattr/bigbluebutton-historic/swattr.csv -m 12 -x ../benchmark/bigbluebutton/text_2015/bigbluebutton_2015.txt
python3 eval.py -g ../benchmark/jabref/text_2021/goldstandard.csv -t ../results/swattr-raw/jabref/ -o ../results/swattr/jabref/swattr.csv -m 6 -x ../benchmark/jabref/text_2021/jabref.txt
python3 eval.py -g ../benchmark/jabref/text_2016/goldstandard.csv -t ../results/swattr-raw/jabref-historic/ -o ../results/swattr/jabref-historic/swattr.csv -m 6 -x ../benchmark/jabref/text_2016/jabref_2016.txt
python3 eval.py -g ../benchmark/mediastore/text_2016/goldstandard.csv -t ../results/swattr-raw/mediastore/ -o ../results/swattr/mediastore/swattr.csv -m 14 -x ../benchmark/mediastore/text_2016/mediastore.txt
python3 eval.py -g ../benchmark/teammates/text_2021/goldstandard.csv -t ../results/swattr-raw/teammates/ -o ../results/swattr/teammates/swattr.csv -m 8 -x ../benchmark/teammates/text_2021/teammates.txt
python3 eval.py -g ../benchmark/teammates/text_2015/goldstandard.csv -t ../results/swattr-raw/teammates-historic/ -o ../results/swattr/teammates-historic/swattr.csv -m 8 -x ../benchmark/teammates/text_2015/teammates_2015.txt
python3 eval.py -g ../benchmark/teastore/text_2020/goldstandard.csv -t ../results/swattr-raw/teastore/ -o ../results/swattr/teastore/swattr.csv -m 11 -x ../benchmark/teastore/text_2020/teastore.txt
python3 eval.py -g ../benchmark/teastore/text_2018/goldstandard_AB.csv -t ../results/swattr-raw/teastore-historic/ -o ../results/swattr/teastore-historic/swattr.csv -m 11 -x ../benchmark/teastore/text_2018/teastore_2018_AB.txt
