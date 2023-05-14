This is a reminder to the package's author of how to build the Docker container.

   - Start the [Docker Desktop app](https://www.docker.com/products/docker-desktop).
   
   - In the directory with the Dockerfile, type the command:
   
         docker build -t wgseligman/jupyter-pyroot .
         
   - The primary reason to rebuild this docker container is to take advantage of new versions of the various packages. Therefore, the first time you run the above command, you probably want to use the `--no-cache` option. Without that, docker will use the cached results from the previous build and won't actually rebuild anything:
   
         docker build --no-cache -t wgseligman/jupyter-pyroot .
         
   - I'm running on a Mac with an M1 chip, and the docker container may easily be run on an AMD64 machine. So we now need two builds:
   
         docker build --no-cache --platform=linux/arm64 -t wgseligman/jupyter-pyroot:latest-arm64 .
         docker build --no-cache --platform=linux/amd64 -t wgseligman/jupyter-pyroot:latest-amd64 .
         
   - If the build is successful, push the container to the [Dockerhub repository](https://hub.docker.com/r/wgseligman/jupyter-pyroot):
   
         docker push wgseligman/jupyter-pyroot
         
Prior to 2021, this procedure was not necessary; the [github repository](https://github.com/wgseligman/docker-jupyter-pyroot) was linked to Dockerhub so any
changes in the github files would cause the docker container to be rebuilt. However, 
Dockerhub now charges for such a link. 

When preparing this container in Sep-2021, I discovered that the container build process
had become trickier, as more of the python packages began to require C++11 and other
development features. So it's probably best that I now have to supervise the container
rebuild personally so that I'm aware of any problems during compilation. 
