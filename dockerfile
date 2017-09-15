## our base image ##
FROM ubuntu:16.04
MAINTAINER Rami Mohammad "aminrami1991@gmail.com"
RUN apt-get update -y
## Installation && Upgrade python verion to 2.7.13 ##
RUN apt-get install -y python2.7 
RUN python2.7 -V
RUN apt-get update -y &&  apt-get install -y build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
WORKDIR /usr/src/  
RUN pwd
RUN ls -ltr
ADD https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz /usr/src/
RUN ls -ltr 
RUN tar xzf Python-2.7.13.tgz 
WORKDIR Python-2.7.13
RUN pwd && ./configure && make altinstall
WORKDIR /
RUN python2.7 -V
## Flask , Mysql-python ##
RUN apt-get update -y && apt-get install -y python-pip python-flask python-dev libmysqlclient-dev
RUN pip install -U pip
RUN pip install flask MySQL-python 
## Running app ##
RUN mkdir /app/ 
WORKDIR /app/
COPY application.py /app/
CMD ["python", "application.py"]
## Mysql-server >> through docker-compose.yml much easier than here# 
#RUN debconf-set-selections <<< "mysql-server mysql-server/root_password password ' ' "
#RUN debconf-set-selections <<< "mysql-server mysql-server/root_password_again password ' ' "
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-client mysql-server
#RUN systemctl status mysql
#RUN mysql --user=root --password=" "  -h localhost --execute="show databases;"
#EXPOSE 3306
#RUN mysql --user=root --password=" "  -h localhost --execute="CREATE USER 'newproject'@'localhost' IDENTIFIED BY 'test123test'; CREATE DATABASE newdb; GRANT ALL ON newproject.* TO 'newproject'@'localhost'; FLUSH PRIVILEGES;"
#RUN mysql --user=root --password=" "  -h localhost --execute="show databases;"
#ENV MYSQL_USERNAME = newproject
#ENV MYSQL_PASSWORD = test123test
#ENV MYSQL_INSTANCE_NAME = newdb
#ENV MYSQL_PORT_3306_TCP_ADDR = localhost
#ENV MYSQL_PORT_3306_TCP_PORT = 3306
