set -o xtrace
set -e

if [ ! -f "$1_color.svg" ]; then
	echo "$1_color.svg does not exist"
	exit 1
fi

# Color
#convert $1_color.svg $1_color.pdf  # rasterize
#cairosvg $1_color.svg -o $1_color.pdf  # remains vector; brakes fonts
inkscape $1_color.svg --export-pdf=$1_color.pdf 2>/dev/null
convert $1_color.svg $1_color.png

# Black and white
sed "s/#bd4628/#000000/g" <<< `cat $1_color.svg` >tmp_bw.svg
#cairosvg tmp_bw.svg -o $1_bw.pdf
inkscape tmp_bw.svg --export-pdf=$1_bw.pdf 2>/dev/null
rm tmp_bw.svg

# convert -verbose -density 150 -trim in.pdf -quality 100 -flatten -sharpen 0x1.0 out.png
