# Based on Ubuntu 20.04, because the latest vesions of Cura need a fairly
# new Qt, only in Ubuntu 18.10+ (so packages aren't available for 18.04)
# See: https://github.com/thopiekar/Cura-packaging/issues/58
#
# https://launchpad.net/~thopiekar/+archive/ubuntu/cura
#
# Using packaging from:
# https://github.com/thopiekar/Cura-packaging/
#
FROM ubuntu:focal

RUN apt-get -y update && \
    apt-get -y install software-properties-common && \
    add-apt-repository ppa:thopiekar/cura && \
    apt-get -y update && \
    apt-get -y install cura

# Additional modules that seem to be needed
RUN apt-get -y install python3-requests python3-cryptography

CMD /usr/bin/cura
