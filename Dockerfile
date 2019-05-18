FROM ubuntu:18.10
RUN apt-get update
RUN apt-get -y install g++
RUN apt-get -y install cmake
RUN apt-get -y install git
WORKDIR /usr/src/mycpptutorial
RUN git clone https://github.com/mycpptutorial/datetimeutil-shared-lib.git
RUN cd datetimeutil-shared-lib && mkdir build && cd build && cmake .. && make && make install
COPY . /usr/src/mycpptutorial/using-shared-lib
WORKDIR /usr/src/mycpptutorial/using-shared-lib
RUN rm -rf build
RUN mkdir -p build && cd build && cmake .. && make
ENTRYPOINT ["/usr/src/mycpptutorial/using-shared-lib/build/main"]
