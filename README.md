# KiCad Nightly for Docker

Basic dockerfile to generate an Ubuntu-based Docker container running KiCad from ppa:js-reynaud/ppa-kicad.

I needed a simple way to run a nightly build of KiCad on Arch Linux.

### Usage

```
docker build -t kicad-ubuntu .
xhost +
docker run -ti --rm -v ~/.kicad:/home/kicad kicad-ubuntu -v ~/path/project:/home/kicad/project -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY
```

### Credits

Based on [https://github.com/mithro/docker-kicad](https://github.com/mithro/docker-kicad).
