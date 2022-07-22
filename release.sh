#!/bin/bash
source .venv/bin/activate
python loconotion https://hanchon.notion.site/Hanchon-live-Random-Notes-dff14ee83df54842b484b9c77f72f0ef
git branch -D gh-pages
git checkout -b gh-pages
rm -rf /tmp/blog
mkdir /tmp/blog
mv ./dist/hanchon-live-random-notes/* /tmp/blog
rm -rf *
rm -rf .github/workflows
rm .gitignore
echo .venv >> .gitignore
echo .logs >> .gitignore
echo notes.hanchon.live >> CNAME
cp /tmp/blog/* ./
git add .
git commit -m "feat: release"
git push -f origin gh-pages
git checkout master
