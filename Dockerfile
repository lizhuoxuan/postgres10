FROM postgres:10

MAINTAINER xzlzx (307871680@qq.com)

RUN apt-get -y update 
RUN apt-get -y install apt-utils 
RUN apt-get -y install gcc make wget libssl-dev libkrb5-dev
RUN apt-get -y install postgresql-server-dev-10
RUN apt-get -y install postgresql-10-plv8
RUN apt-get -y install postgresql-10-mysql-fdw
RUN wget https://github.com/postgrespro/pg_pathman/archive/1.4.9.tar.gz && \
  tar -xvzf 1.4.9.tar.gz && \
  cd pg_pathman-1.4.9 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R pg_pathman-1.4.9 && \
  rm -rf /var/lib/apt/lists/*
