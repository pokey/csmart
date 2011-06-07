#!/bin/bash

echo -n "Are you sure you want to delete everything in the index? [y/n] ";
read confirm

if [ "$confirm" == "y" ]; then
	curl "http://csmart.stanford.edu:8983/solr/update/" -F stream.body=" <delete><query>*:*</query></delete>"
	curl "http://localhost:8983/solr/update/" --data-binary '<commit/>' -H 'Content-type:text/xml; charset=utf-8'
fi


