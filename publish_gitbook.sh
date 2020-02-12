rootPWD="$(PWD)"

[ -d build ] || mkdir build;
rsync -ah ./pages/ ./build/ --delete;

cd ./build

git init
git add *
git commit  -m "update"
git push --force git@github.com:roadsidechurch-kr/book.git master:gitbook

gitbook install && gitbook build

cd ./_book
git init
git add *
git commit -m "update"

git push --force git@github.com:roadsidechurch-kr/book.git master:gh-pages

cd $rootPWD;