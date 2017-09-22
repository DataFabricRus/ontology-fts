#!/usr/bin/env bash

function usage
{
    echo "usage: docgen.sh --input <WIDOCO_INPUT> [--jar <WIDOCO_JAR>]
    "
}

WIDOCO_JAR=widoco-1.4.2-jar-with-dependencies.jar
WIDOCO_INPUT=
WIDOCO_LANGUAGES=ru

while [ "$1" != "" ]; do
    case $1 in
        --input )       shift
                        WIDOCO_INPUT=$1
                        ;;
        --jar )         shift
                        WIDOCO_JAR=$1
                        ;;
        -h | --help )   usage
                        exit
                        ;;
        * )             usage
                        exit 1
                        ;;
    esac
    shift
done

###
# Main
###

if [ "$WIDOCO_INPUT" == "" ]; then
    usage
    exit 1
fi

WIDOCO_ONTOLOGY=$WIDOCO_INPUT/ontology.ttl
WIDOCO_OUTPUT=$WIDOCO_INPUT/docs
WIDOCO_CONFIG=$WIDOCO_INPUT/config.properties

if [ -z "$(ls -A $WIDOCO_OUTPUT)" ]; then
    java -jar $WIDOCO_JAR -ontFile $WIDOCO_ONTOLOGY -outFolder $WIDOCO_OUTPUT -getOntologyMetadata -lang $WIDOCO_LANGUAGES -rewriteAll
else
    java -jar $WIDOCO_JAR -ontFile $WIDOCO_ONTOLOGY -outFolder $WIDOCO_OUTPUT -getOntologyMetadata -lang $WIDOCO_LANGUAGES -crossRef -rewriteAll
fi

