#!/bin/sh

ENDPOINT="http://35.187.6.214:8080/blazegraph/sparql"
CONTEXT=http%3A%2F%2Fopenfts.ru%2FBM

N_TRIPLES="text/plain"
N_QUADS="text/x-nquads"
TURTLE="application/x-turtle"
RDFXML="application/rdf+xml"
TRIG="application/x-trig"

upload() {
    echo "\nUploading: ".$1
    curl -D- -L -u guest:guest -H "Content-Type: $2" --upload-file $1 -X POST "$ENDPOINT?context-uri=$3"
}


# data
for filename in ./*.ttl ./*/*.ttl ../ontologies/*/*.ttl ../fundamental-relations/FRs.ttl ../fundamental-categories/FundamentalCategory.ttl; do
    upload "$filename" $TURTLE "http%3A%2F%2Fopenfts.ru%2F/ontology"
done
