# As of 11-Feb-2020, this will install:
# - CentOS 7
# - Jupyter 1.0.0
# - ROOT 6.18.04

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
RUN pip3 install --upgrade jupyter jupyterlab rootpy rootkernel
RUN pip3 install --upgrade iminuit numpy scipy matplotlib pandas root-numpy sympy tensorflow terminado uproot urllib3 pycurl tables

RUN yum clean all

# Run jupyter
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8080", "--allow-root"]
