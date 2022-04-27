dir=../data/yago4/administrative_divisions_of_Greece/labels
grep -hr "<http://schema.org/geo>" $dir/facts.nt > $dir/geo.nt
grep -hr "<http://schema.org/alternateName>" $dir/{Regional_units_YAGO.txt}_labels.nt > $dir/temp.nt
grep -hr "<http://www.w3.org/2000/01/rdf-schema#label>" $dir/{Regional_units_YAGO.txt}_labels.nt >> $dir/temp.nt
grep -hr "@en" $dir/temp.nt > $dir/reg_units.nt
grep -hr "@el" $dir/temp.nt >> $dir/reg_units.nt
grep -hr "@grc" $dir/temp.nt >> $dir/reg_units.nt
rm -rf $dir/temp.nt
