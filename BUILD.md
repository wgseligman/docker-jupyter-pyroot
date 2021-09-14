This is a reminder to the package's author of how to build the Docker container.

   - Start the [Docker Desktop app](https://www.docker.com/products/docker-desktop).
   
   - In the directory with the Dockerfile, type the command:
   
         docker build -t wgseligman/jupyter-pyroot .
         
   - If the build is successful, push the container to the [Dockerhub repository](https://hub.docker.com/repository/docker/wgseligman/jupyter-pyroot):
   
         docker push wgseligman/jupyter-pyroot
         
Prior to 2021, this procedure was not necessary; the [github repository](https://github.com/wgseligman/docker-jupyter-pyroot) was linked to Dockerhub so any
changes in the github files would cause the docker container to be rebuilt. However, 
Dockerhub now charges for such a link. 

When preparing this container in Sep-2021, I discovered that the container build process
had become trickier, as more of the python packages began to require C++11 and other
development features. So it's probably best that I now have to supervise the container
rebuild personally so that I'm aware of any problems during compilation. 
