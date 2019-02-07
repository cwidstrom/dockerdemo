FROM centos:6
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
RUN curl -sSL https://www.sourceclear.com/install | bash
RUN srcclr activate "73ae83d1-5e78-4d05-a183-32f81298ebfc"
RUN SRCCLR_ENABLE_CONTAINERS=true srcclr scan --image dockertest:5