golang-terraform-devtools
-------------------------

This repository contains a Dockerfile that aims to help to run `golang/terratests` automated tests and do so by providing the `terraform` and `terragrunt` binaries (built over a golang image).

The image `gcavalcante8808/golang-terraform-devtools` is built on a regular basis by Docker image service from the Dockerfile.

Take a look at the [Dockerfile](Dockerfile) to check what terraform and terragrunt versions are available by default.

Simple Usage
------------

Using the terminal, navigate to your golang project/tests folder and run the following commands (requires docker):

```bash
docker run -it --rm -v $(pwd):/data gcavalcante8808/golang-terraform-devtools bash
cd /data
go test
```

Building
--------

If you need to build your own image with different terraform or terragrunt versions, you can do it by using docker in the following way:

```
git clone https://github.com/gcavalcante8808/golang-terraform-devtools.git
cd golang-terraform-devtools
docker build --build-arg TERRAFORM_VERSION=<SOME_TF_VERSION> TERRAGRUNT_VERSION=<SOME_TG_VERSION> . -t my-own-image
```

Author
------

Author: Gabriel Abdalla Cavalcante Silva (gabriel.cavalcante88@gmail.com)

