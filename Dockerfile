FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF

RUN apt-get -y update && \
    apt-get -y install mesos=0.26.0-0.2.145.ubuntu1404 && \
    apt-get install -y vim

ADD supervisord.conf /etc/
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
