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
RUN SRCCLR_API_TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWFtSWQiOiIxMTYyNSIsInNjb3BlIjpbXSwiaWQiOjQzMzYwLCJleHAiOjE1NDk1NjcxMzEsImF1dGhvcml0aWVzIjoiQUdFTlQiLCJvcmdJZCI6IjExODMiLCJqdGkiOiIwNjQwYjU0ZC01NWFiLTRkNDgtODhmYy00ZTMzMTQzOWZjZWMiLCJjbGllbnRfaWQiOiIifQ.h42HiehcBhdjhLMvUGuSSW_n9uKGpCkkXHs78Z5Y5Khlf13SZ-P-GFYJ-h6xgwRDgqHYr4FcKQhuyH-c7NII06MSGoBrMvfx6X11dP_Otm8n4--gyJeHGMOhXLUINouO1xjXlVBDO6nS8B8NVoatPla_ZsfhIHEExDW6byD2kfc curl -sSL https://download.sourceclear.com/ci.sh | sh
RUN SRCCLR_ENABLE_CONTAINERS=true srcclr scan --image dockertest:5