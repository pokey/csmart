#!/bin/sh

FILE=$1
URL="http://localhost:8983/solr/update/extract?uprefix=attr_&fmap.content=attr_content"
d=0

for f in `cat $FILE`; do
  d=`expr $d + 1`;
  echo Posting $f to $URL
  curl "$URL&literal.id=doc$d" -F stream.url="$f"
  echo
done

#send the commit command to make sure all the changes are flushed and visible
curl "http://localhost:8983/solr/update/" --data-binary '<commit/>' -H 'Content-type:text/xml; charset=utf-8'
echo
