set -e
yarn run build
cd dist
git init
git add -A
git commit -m 'Deploy'
git push -f git@github.com:KateHoward10/how-word.git master:gh-pages
cd -
