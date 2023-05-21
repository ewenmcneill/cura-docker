# Based on Ubuntu 20.04, because the latest vesions of Cura need a fairly
# new Qt, only in Ubuntu 18.10+ (so packages aren't available for 18.04)
# See: https://github.com/thopiekar/Cura-packaging/issues/58
#
# https://launchpad.net/~thopiekar/+archive/ubuntu/cura
#
# Using packaging from:
# https://github.com/thopiekar/Cura-packaging/
#
# Updated to skip the apt-add-repository steps described in:
#
# https://thopiekar.eu/cura/ppa/installation/
#
# because (a) software-properties-common drags in a lot of dependencies,
# and (b) Ubuntu Launchpad is returning an error trying to add it
# ("Unauthorized") but the PGP key is still on the keyservers, and
# the package files are still available for download.
#
# This maxes out at Cura 4.8, as that seems to be the last version
# built for Ubuntu Focal in this PPA.
#
# Steps removed:
#    apt-get -y install software-properties-common && \
#    add-apt-repository ppa:thopiekar/cura && \
#
# Key to install found by interactive testing, and how to install it
# via this StackExchange thread:
#
# https://stackoverflow.com/questions/60233172/trying-install-a-ppa-package-on-debian
#
FROM ubuntu:focal

RUN apt-get -y update

COPY thopiekar-ubuntu-cura-focal.list /etc/apt/sources.list.d/thopiekar-ubuntu-cura-focal.list

RUN apt-get -y install gnupg2 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D51DB14E9FFECCF3

RUN apt-get -y update && \
    apt-get -y install cura

# Additional modules that seem to be needed
RUN apt-get -y install python3-requests python3-cryptography

CMD /usr/bin/cura
