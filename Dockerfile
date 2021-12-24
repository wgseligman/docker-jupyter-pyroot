# This will install:
# - CentOS 7
# - Jupyter 
# - ROOT

# To see the version numbers (which change as the EPEL and PyPI repositories evolve)
# start the Terminal from the Jupyter notebook and type (e.g.):

# rpm -q root
# pip3 show jupyter

FROM centos:7

WORKDIR /work

# Install packages from CentOS 7 base, EPEL, and SCL (for a later compiler version)
RUN yum -y update
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install centos-release-scl

# The "native" gcc compiler in CentOS 7 doesn't support C++11, which is
# needed to compile at least one of the python packages below. Include the
# SCL development toolset, which includes a more advanced compiler. 
RUN yum -y install devtoolset-7-gcc*
SHELL [ "/usr/bin/scl", "enable", "devtoolset-7"]

# Install packages needed for ROOT
RUN yum -y install python3 python3-pip root which python3-root python3-devel
RUN yum -y install root-tmva root-tmva-python root-minuit2 python3-jupyroot

# curl will be needed when we install python packages below.
RUN yum -y install curl libcurl libcurl-devel 

# Additional packages for some C++ work:
RUN yum -y install make boost-devel gsl-devel binutils-devel 
#RUN yum -y install gcc-c++ gcc-gfortran

# The "native" version of cmake in CentOS 7 is old and doesn't have
# the necessary features to compile some of the python packages below.
# Set up cmake3 as default version of cmake.
RUN yum -y install cmake3 
RUN ln -sf /usr/bin/cmake3 /usr/bin/cmake

# Other Linux packages required for python package compilation.
RUN yum -y install python36-pillow-devel

# Install packages from PyPI. These are the ones needed for almost any
# Jupyter installation. 
RUN pip3 install --upgrade wheel
RUN pip3 install --upgrade jupyter
RUN pip3 install --upgrade numpy scipy matplotlib 

# These additional packages are handy, but not critical. 
RUN pip3 install --upgrade jupyterlab
RUN pip3 install --upgrade iminuit pandas sympy terminado urllib3 pycurl tables
RUN pip3 install --upgrade rootpy rootkernel root-numpy uproot

# Wrap it up.
RUN yum clean all

# Run jupyter when this docker container is started.
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8080", "--allow-root"]
