# This will install:
# - CentOS 7
# - Jupyter 
# - ROOT 

# To see the version numbers (which change as the EPEL and PyPI repositories evolve)
# start the Terminal from the Jupyter notebook and type:

# rpm -q root
# pip3 show jupyter

FROM centos:7

WORKDIR /work

# Install packages from CentOS 7 base and EPEL
RUN yum -y update
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install python3 python3-pip root which python3-root python3-devel
RUN yum -y install curl libcurl libcurl-devel
RUN yum -y install root-tmva root-tmva-python root-minuit2 python3-jupyroot
# Additional packages for some C++ work:
RUN yum -y install boost-devel gsl-devel binutils-devel

# Install packages from PyPI
RUN pip3 install --upgrade wheel
RUN pip3 install --upgrade jupyter jupyterlab 
RUN pip3 install --upgrade iminuit numpy scipy matplotlib pandas sympy terminado urllib3 pycurl tables
RUN pip3 install --upgrade rootpy rootkernel root-numpy uproot tensorflow
RUN pip3 install --upgrade coffea
RUN pip3 install --upgrade numba colorama icc_rt cffi
RUN pip3 install --upgrade tensorflow

RUN yum clean all

# Run jupyter
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8080", "--allow-root"]
