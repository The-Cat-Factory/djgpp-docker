# Dockerized DJGPP

This repository builds docker images for DJGPP toolchain, using [jwt27's fork](https://github.com/jwt27/build-gcc) of [andrewwutw's build-djgpp](https://github.com/andrewwutw/build-djgpp) scripts.

## Images

2 images are currently built, one for each target:
* `ghcr.io/the-cat-factory/djgpp-i386-pc-msdosdjgpp`
* `ghcr.io/the-cat-factory/djgpp-i586-pc-msdosdjgpp`

## CI/CD setup

Every main branch push builds and publishes a new set of images, tagged with SHA1 of the latest commit. 

If semver tag is pushed to the main branch, version from the tag is used to tag the images. For release versions, images will be tagged as `latest` as well.

Every push to a branch with opened pull request triggers a build of a set of images without publishing them.