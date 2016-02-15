FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos

RUN apt-get install -y vim supervisor && \
    echo "set number" >> /etc/vimrc && \
    echo "set ts=4" >> /etc/vimrc && \
    echo "set expandtab" >> /etc/vimrc && \
    echo "set autoindent" >> /etc/vimrc

#RUN mkdir -p /var/mesos/external_log && \
#    mkdir -p /var/mesos/log && \
#    mkdir -p /var/mesos/work

ADD supervisord.conf /etc/

RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
