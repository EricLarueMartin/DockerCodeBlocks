# Need to run with 
# docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined
# or debugger won't work.

FROM centos:7

# Need to add EPEL repository to find codeblocks package
RUN yum -y update && yum -y install epel-release

# Add a compiler and debugger
RUN yum -y install gcc-c++ gdb

# Need to add the SCL repository to find devtoolset
#RUN yum -y install centos-release-scl
# Add dev toolset 8
#RUN yum -y install devtoolset-8 devtoolset-8-gcc

# install Code::Blocks
RUN yum -y install codeblocks

# should allow GUI to work with an appropriate X server
# Xming (Windows, possibly through XLaunch) or XQuartz (MacOS)
ENV DISPLAY=host.docker.internal:0
