br-containers
=============

This is a project to create a set of minimal, highly reproducible application
images for use in containerized environments.

Initially this project will generate a root filesystem tarball (`rootfs.tar`) 
containing the target application and a minimal set of dependencies. Future
goals include generating Dockerfiles and entrypoint scripts to provide
entrypoint parity with common DockerHub layered images.

Quick Start
-----------
### Install Dependencies

Buildroot's dependencies can be found here:
https://buildroot.org/downloads/manual/manual.html#requirement-mandatory

If you're on Ubuntu, you can install the build deps as such:
```
apt-get install build-essential libncurses5-dev git bzr cvs mercurial subversion unzip bc
```

### Check out buildroot and br-containers
Note: maybe in the future we use `repo` for this.
```
# br-containers and buildroot should be checked out side-by-side.
# the name of the parent directory doesn't matter

mkdir container-workspace
cd container-workspace

git clone https://git.buildroot.net/buildroot
git clone https://github.com/jrb/br-containers
```

### Configure and Build
```
cd br-containers
make redis_defconfig # see br-containers/configs for other image configs
make
```

Buildroot will now download the source for your toolchain and target packages,
and then begin building/installing. If this is the first build, expect a ton 
of code to be downloaded and compiled. One subsequent builds, both a download
and compiler cache will be utilized.

Go for coffee, and when you come back, your rootfs will be available
in `br-containers/output/images/rootfs.tar`.

### Building a Docker Image
Note: Maybe we'll wedge this into the makefile?
```
cp output/images/rootfs.tar apps/redis/docker
cd apps/redis/docker

docker build . -t br-redis
```


##TODO
* Additional Dockerfile/entrypoint scripts to provide compatibility with alpine/ubuntu based dockerhub images
