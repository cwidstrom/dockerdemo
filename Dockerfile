FROM centos:6
RUN curl -fsSLO https://get.docker/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
RUN yum install python
RUN yum -y install epel-release && yum clean all
RUN yum -y install python-pip && yum clean all
RUN yum -y install python-devel  
RUN yum -y install python34-devel 
RUN yum -y install gcc
RUN yum -y install nodejs npm --enablerepo=epel
COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt
COPY app.py /src
COPY __init__.py /src
COPY generator.py /src
CMD python /src/app.py