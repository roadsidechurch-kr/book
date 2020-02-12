rootPWD="$(PWD)"
buildDIR="build"
bookDIR="_book"

[ -d $buildDIR ] && rm -rf $buildDIR;
git clone git@github.com:roadsidechurch-kr/book.git --branch gitbook $buildDIR
rsync -ah ./pages/ ./$buildDIR/ --delete;
git add *
git commit  -m "update"
git push

cd ./$buildDIR

git clone git@github.com:roadsidechurch-kr/book.git --branch gh-pages $bookDIR
gitbook install && gitbook build

cd ./$bookDIR
git add *
git commit -m "update"
git push

cd $rootPWD;