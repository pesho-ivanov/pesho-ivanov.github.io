set -o xtrace

# Color
#convert $1_color.svg $1_color.pdf  # rasterize
cairosvg $1_color.svg -o $1_color.pdf  # remains vector
convert $1_color.svg $1_color.png

# Black and white
sed "s/#bd4628/#000000/g" <<< `cat $1_color.svg` >tmp_bw.svg
cairosvg tmp_bw.svg -o $1_bw.pdf


# convert -verbose -density 150 -trim in.pdf -quality 100 -flatten -sharpen 0x1.0 out.png
