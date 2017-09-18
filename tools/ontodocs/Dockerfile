FROM fedora:26

RUN dnf upgrade -y && dnf install -y python-pip

WORKDIR /ontodocs

RUN pip install ontodocs -U

CMD echo 2 | ontodocs ./docs/source.ttl -o ./docs/output --theme cosmo
