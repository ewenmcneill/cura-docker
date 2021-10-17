# Cura packaged as a container from Ubuntu PPA

This image packages [Thomas Pietrowski's cura PPA](https://launchpad.net/~thopiekar/+archive/ubuntu/cura) so that it can be run in an isloated container.

Originally [dockerised by 
Steve Baker](https://github.com/steveb/cura-docker/);
there is another [dockerised Cura by 
Mathias Rühle](https://github.com/EmteZogaf/cura-docker) which points at the
development version of Cura.

Build the Docker container with something like:

```sh
docker build -t focal-cura-4.8 .
```

Then use the included `cura-docker` script to run Cura, eg:

```sh
#! /bin/sh
./cura-docker focal-cura-4.8 -v /src/cura/models:/src/cura/models
```
