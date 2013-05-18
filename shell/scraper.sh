#!/bin/sh
for line in `cat .sites`; do
  # replace http://
  stripped_url=`echo $line| cut -c8-`
  target_folder="/home/thomas/100/$1/"

  echo $stripped_url
  echo ""
  echo ""
  echo ""
  echo "Scraping $stripped_url"
  echo "-----------------------------------"
 # echo "> creating folder.."
  echo $target_folder
 # mkdir -p $target_folder
  echo "> scraping $stripped_url"
  wget -e robots=off \
    -H -nd -nc -np \
    --recursive -p \
    --level=1 \
    --accept gif,jpg,jpeg \
    --convert-links -N \
    --limit-rate=400k \
    --wait 1.0 \
    -P $target_folder $stripped_url
  echo ""
  echo ""
  echo "> Finished scraping $stripped_url"
done
