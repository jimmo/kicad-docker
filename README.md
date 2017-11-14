# KiCad Nightly for Docker

Basic dockerfile to generate an Ubuntu-based Docker container running KiCad from ppa:js-reynaud/ppa-kicad.

I needed a simple way to run a nightly build of KiCad on Arch Linux.

### Usage

```
# Create the image
docker build -t kicad-ubuntu .

# Enable any user to connect to X display
xhost +

# Replace ~/path/project to a path that will be mapped to ~/project inside the container.
docker run -ti --rm -v ~/.kicad:/home/kicad -v ~/path/project:/home/kicad/project -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY kicad-ubuntu

# To run a shell inside the container:
docker run -ti --rm -v ~/.kicad:/home/kicad -v ~/path/project:/home/kicad/project -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --entrypoint bash kicad-ubuntu
```

### Credits

Based on [https://github.com/mithro/docker-kicad](https://github.com/mithro/docker-kicad).
