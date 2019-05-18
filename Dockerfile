FROM ubuntu:18.10
RUN apt-get update
RUN apt-get -y install g++
RUN apt-get -y install cmake
RUN apt-get -y install git
WORKDIR /usr/src/mycpptutorial
COPY . /usr/src/mycpptutorial/using-static-shared-lib
WORKDIR /usr/src/mycpptutorial/using-static-shared-lib
RUN rm -rf build
RUN mkdir -p build && cd build && cmake .. && make
ENTRYPOINT ["/usr/src/mycpptutorial/using-static-shared-lib/build/main"]
