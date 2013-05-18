#!/bin/sh
for line in `cat .sites`; do
  n_url=`echo $line| cut -c8-`
  target="$1"

  echo $n_url
  echo "raping $n_url >"
  echo ""
  echo $target
  mkdir -p $target
  echo "> scraping $n_url"
  wget -e robots=off \
    -H -nd -nc -np \
    --recursive -p \
    --level=1 \
    --accept gif,jpg,jpeg \
    --convert-links -N \
    --limit-rate=400k \
    --wait 1.0 \
    -P $target $n_url
  echo ""
  echo "> $n_url has been raped.."
done
