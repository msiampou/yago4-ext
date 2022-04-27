classes=`ls ../data/yago4/administrative_divisions_of_Greece/classes/*.txt`
yago=../data/yago4/full/2020-02-24
ext=../data/yago4/administrative_divisions_of_Greece
mkdir $ext/new
for file in $classes
do
  	line=$(cat $file | sed 's/\|/ /' | awk '{print $1}')
	name=$(echo $file | awk -F "/" '{print $6}')
	echo $name
	echo "facts"
	zgrep "$line" "$yago/yago-wd-facts.nt.gz" > $ext/new/facts.nt
	echo "full-types"
	zgrep "$line" "$yago/yago-wd-full-types.nt.gz" > $ext/new/full-types.nt
	echo "labels"
	zgrep "$line" "$yago/yago-wd-labels.nt.gz" > $ext/new/labels.nt
	echo "same-as"
	zgrep "$line" "$yago/yago-wd-sameAs.nt.gz" > $ext/new/sameAs.nt
	echo "schema"
	zgrep "$line" "$yago/yago-wd-schema.nt.gz" > $ext/new/schema.nt
	echo "shapes"
	zgrep "$line" "$yago/yago-wd-shapes.nt.gz" > $ext/new/shapes.nt
	echo "simple-types"
	zgrep "$line" "$yago/yago-wd-simple-types.nt.gz" > $ext/new/simple-types.nt
	echo "annotated-facts"
	zgrep "$line" "$yago/yago-wd-annotated-facts.ntx.gz" > $ext/new/annotated-facts.nt
	echo "classes"
	zgrep "$line" "$yago/yago-wd-class.nt.gz" > $ext/new/class.nt
done