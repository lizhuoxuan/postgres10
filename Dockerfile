FROM postgres:10

MAINTAINER xzlzx (307871680@qq.com)

RUN apt-get -y update 
RUN apt-get -y install gcc make wget unzip libssl-dev libkrb5-dev apt-utils
RUN apt-get -y install postgresql-server-dev-10
RUN apt-get -y install postgresql-10-plv8
RUN apt-get -y install postgresql-10-mysql-fdw
RUN wget https://codeload.github.com/postgrespro/pg_pathman/zip/1.4.9 && \
  unzip 1.4.9 && \
  cd pg_pathman-1.4.9 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R 1.4.9 && \
  rm -rf /var/lib/apt/lists/*
