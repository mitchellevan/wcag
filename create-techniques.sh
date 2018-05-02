#!/bin/bash
cp technique-template.html ../../technique-template.html
cd ..
while [ $# -gt 0 ]
do
  git checkout --orphan tech-$2
  git rm -rf .
  mkdir techniques/$1
  cp ../technique-template.html techniques/$1/$2.html
  sed -i "s/Technique Title/$3/g" techniques/$1/$2.html
  git add techniques/$1/$2.html
  git commit -m "Set up $2 technique"
  echo git push --set-upstream origin tech-$2
  shift
  shift
  shift
done
rm ../technique-template.html
echo git checkout technique-setup