# A docker image for building Haskell static binaries that match the 
# Amazon Linux library versions that you'd use in AWS Lambda.
FROM amazonlinux
MAINTAINER Alex Collins, atc <at> AKISystems <dot> net

# Install required static development libs 
RUN yum update -y && \
    yum install -y \
    gcc \
    glibc-static \
    gmp-static \
    shadow-utils \
    zlib-devel \
    postgresql-devel \
    xz

# Install Haskell stack
RUN curl -sSL https://get.haskellstack.org/ | sh

# Install GHC so we're ready to build
RUN stack setup
