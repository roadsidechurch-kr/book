rootPWD="$(pwd)"
buildDIR="build"
bookDIR="_book"

[ -d $buildDIR ] && rm -rf $buildDIR;
git clone git@github.com:roadsidechurch-kr/book.git --branch gitbook $buildDIR
rsync -ah ./pages/ ./$buildDIR/ --delete --exclude .git;

cd ./$buildDIR
git add .
git commit  -m "update"
git push;

git clone git@github.com:roadsidechurch-kr/book.git --branch gh-pages $bookDIR
gitbook install && gitbook build

cd ./$bookDIR
git init
git add .
git commit -m "update"
git push --force git@github.com:roadsidechurch-kr/book.git master:gh-pages

cd $rootPWD;