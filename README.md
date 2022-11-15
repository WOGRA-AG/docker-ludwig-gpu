# docker-ludwig-gpu

A lightweight docker image with ludwig and nvidia gpu support for further 
customization using poetry. The compressed size is about 6GB compared to 
the 9GB provided by ludwigai, see [here](https://hub.docker.com/r/ludwigai/ludwig-gpu/tags).


The motivation for this docker image lies in the [Os4ML](https://github.com/WOGRA-AG/Os4ML) 
project in order to save cluster resources. Internal developers 
started to use this image as starting point for customized jupyterhub 
images providing a pre-installed individual set of python package.

KNOWN ISSUE: This is a pytorch-optimized version regarding the gpu supprt. 
Tensorflow won't work out of the box. This is because Tensorflow depends 
on the system cuda libraries - not the python packages - which are not 
installed.