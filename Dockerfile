FROM ubuntu

#Set up Ubuntu
RUN bash
RUN apt-get update && \
    apt-get install -y lsb-release && \
    apt-get clean all && \
    apt-get install -y build-essential libssl-dev libffi-dev python-dev && \
    apt-get install -y git && \
    mkdir /home/infoblox

#Set up Python
RUN apt-get install -y python3-pip && \
    apt-get install -y python3-venv

#Set up Ansible
RUN git clone https://github.com/ansible/ansible.git && \
    mv /ansible /home/infoblox && \
    python3 -m venv /home/infoblox/ansible/ansible-dev-venv && \
    . /home/infoblox/ansible/ansible-dev-venv/bin/activate && pip install -r home/infoblox/ansible/requirements.txt

#Add dev files
COPY DEV /tmp
COPY modules /home/infoblox/ansible/lib/ansible/modules
COPY tmp /tmp
COPY $USER_NAME /home/infoblox
#To Start virtual environment:
#Ansible development environement [ source /home/infoblox/ansible/ansible-dev-venv/bin/activate && source /home/infoblox/ansible/hacking/env-setup ]


