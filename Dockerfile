ARG ubuntu_version=impish

FROM ubuntu:${ubuntu_version}

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y wget software-properties-common

RUN sh -c "wget -O - https://dl.openfoam.org/gpg.key | apt-key add -"
RUN add-apt-repository http://dl.openfoam.org/ubuntu
RUN apt-get update
RUN apt-get -y install openfoam9
RUN echo ". /opt/openfoam9/etc/bashrc" >> ~/.bashrc
RUN bash -c 'source /opt/openfoam9/etc/bashrc && mkdir -p $FOAM_RUN'
WORKDIR "/root/OpenFOAM/-9/run"