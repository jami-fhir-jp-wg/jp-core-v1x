FROM ubuntu:latest
WORKDIR /app
ARG JPPACKAGECOREtgz
ARG JPTerminologyCOREdir
ARG JPTerminologyCOREPtgz
RUN apt-get update &&\
    apt-get install -y npm jekyll curl openjdk-17-jdk &&\
    npm install -g fsh-sushi &&\
    curl -o "/tmp/$JPPACKAGECOREtgz" "https://jpfhir.jp/fhir/$JPPACKAGECOREtgz" &&\
    curl -o "/tmp/$JPTerminologyCOREPtgz" "https://jpfhir.jp/fhir/core/terminology/$JPTerminologyCOREPtgz" &&\
    mkdir -p "/root/.fhir/packages/$JPTerminologyCOREdir" &&\
    tar -xvzf "/tmp/$JPPACKAGECOREtgz" -C "/root/.fhir" &&\
    tar -xvzf "/tmp/$JPTerminologyCOREPtgz" -C "/root/.fhir/packages/$JPTerminologyCOREdir" &&\
    rm /tmp/*.tgz
