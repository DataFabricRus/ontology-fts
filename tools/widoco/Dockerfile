FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    ONTOLOGY_FILE=./ontology.ttl

WORKDIR /widoco

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y openjdk-8-jre-headless

ADD https://github.com/dgarijo/Widoco/releases/download/v1.4.1/widoco-1.4.1-jar-with-dependencies.jar widoco.jar

RUN rm -rf ./docs/*

CMD java -jar widoco.jar -ontFile $ONTOLOGY_FILE -outFolder ./docs -getOntologyMetadata -rewriteAll -lang ru-en