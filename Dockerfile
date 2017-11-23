FROM postgres:10

MAINTAINER xzlzx (307871680@qq.com)

RUN apt-get -y update 
RUN apt-get -y upgrade
RUN apt-get -y install gcc make wget unzip openssl 
RUN apt-get -y install libpq-dev
RUN apt-get -y install postgresql-contrib-10
RUN apt-get -y install postgresql-server-dev-10
RUN apt-get -y install postgresql-10-plv8
RUN apt-get -y install default-libmysqlclient-dev
RUn apt-get -y git
RUN wget https://codeload.github.com/EnterpriseDB/mysql_fdw/zip/REL-2_3_0 && \
  unzip REL-2_3_0 && \
  cd mysql_fdw-REL-2_3_0 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R mysql_fdw-REL-2_3_0
RUN git clone https://github.com/postgrespro/pg_pathman && \
  cd pg_pathman && make USE_PGXS=1 && make USE_PGXS=1 install && \
  rm -rf /var/lib/apt/lists/*
