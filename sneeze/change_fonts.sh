sed "s/Noto Serif/Times/g" <<< `cat $1` >tmp.svg
sed "s/Scada/Arial/g" <<< `cat tmp.svg` >tmp2.svg
#rm tmp.svg
cp tmp2.svg $1
rm tmp.svg tmp2.svg
