## Docker-compose ##
1.docker-compose build
// 2.docker-compose up -d

##steps below , when you don't want to use docker compose ##

1.docker build -t anynameyouwant .
// 2.docker run -d -p 3000:3000 anynameyouwant
// 3.type this generated link in your browser :
  docker inspect $(docker ps |grep anynameyouwant|awk '{printf $1}'|xargs)|grep IPAddress |cut -d '"' -f 4|xargs |awk '{print "http://"$1":3000"}'


