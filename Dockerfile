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
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DF7DD7A50B746DD4
RUN sudo add-apt-repository "deb https://download.srcclr.com/ubuntu stable/"
RUN sudo apt-get update
RUN sudo apt-get install srcclr
RUN srcclr activate "28002903-77e3-4804-b32f-c93792df8f7b"
RUN SRCCLR_ENABLE_CONTAINERS=true srcclr scan --image dockertest:5