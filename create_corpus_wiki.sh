mkdir corpus

python WikiExtractor.py -c -b 25M -o extracted enwiki-latest-pages-articles.xml.bz2
find extracted -name '*bz2' \! -exec bzip2 -k -c -d {} \; > enwiki.xml
printf "Number of articles: "
grep -o "<doc" enwiki.xml | wc -w
sed -i 's/<[^>]*>//g' enwiki.xml
rm -rf extracted