[ROOT](https://root.cern.ch/) is a toolkit developed at [CERN](https://home.cern/). Its primary audience is particle physicists who want to perform data analysis.

This docker container is an off-shoot of a [ROOT tutorial](https://www.nevis.columbia.edu/~seligman/root-class/) I've taught at [Nevis Labs](https://www.nevis.columbia.edu/) for the past couple of decades. At Nevis I've set up a [Juptyerhub](https://jupyterhub.readthedocs.io/en/stable/) server for use by the particle-physics students and researchers. That's not enough for some of the scientists, especially those who take their laptops on plane rides without internet access. 

I've documented a [conda-based installation procedure](https://twiki.nevis.columbia.edu/twiki/bin/view/Main/JupyterROOTContainers). This docker container is meant to provide a pre-compiled local copy of a Jupyter/ROOT/C++ workspace for those for whom conda is not a good solution.

This project was inspired by [sidebo/docker-pyroot-notebook](https://github.com/sidebo/docker-pyroot-notebook), but was created independently. It's meant to match the OS (AlmaLinux 9) and ROOT version (6.26.10 as of Feb-2023) in use on the Nevis Jupyterhub server, along with the Python and C++ packages most commonly used by Nevis physicists.

If you wanted the already-built version, it is in a [Dockerhub](https://hub.docker.com/r/wgseligman/jupyter-pyroot) repository. You can download and execute the docker container with (in UNIX):

```
sudo docker run -p 8080:8080 -v $PWD:/work wgseligman/jupyter-pyroot
```

To change the host port mapping to a different port than 8080 change the first `8080` to the desired port number. To change the mapping from the internal container `/work` directory to some other host directory, change the `$PWD` to the desired directory. 

Note that I create the pre-built version on an Apple Silicon M1 Macintosh. It might not run on an Intel system. 
