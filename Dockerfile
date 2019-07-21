# Based on Ubuntu 19.04, because the latest vesions of Cura need a fairly
# new Qt, only in Ubuntu 18.10+
# See: https://github.com/thopiekar/Cura-packaging/issues/58
#
FROM ubuntu:disco

RUN apt-get -y update && \
    apt-get -y install software-properties-common && \
    add-apt-repository ppa:thopiekar/cura && \
    apt-get -y update && \
    apt-get -y install cura

# Additional modules that seem to be needed
RUN apt-get -y install python3-requests

CMD /usr/bin/cura
