#!/usr/bin/env bash

git add . -A
git commit -m "automatic commit"
git push origin korean

git checkout -B gh-pages
git rebase korean

touch .nojekyll

echo '!docs/_build' >> .gitignore

cd docs
make -e SPHINXOPTS="-D language='ko'" html
cd ..

git add . -A
git commit -m "build"
git push -f origin gh-pages
git reset --hard HEAD
git clean -f
git checkout korean
