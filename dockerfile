FROM postgres:10.0

MAINTAINER xzlzx (307871680@qq.com)

RUN apt-get -y update 
RUN apt-get -y install gcc gcc-c++ make wget unzip openssl openssl-devel pcre-devel
RUN apt-get -y install postgresql-server-dev-10.0
RUN apt-get -y install postgresql-10.0-plv8
RUN apt-get -y install libmysqlclient-dev
RUN  wget https://github.com/EnterpriseDB/mysql_fdw/archive/REL-2_3_0.zip && \
  unzip REL-2_3_0.zip && \
  cd mysql_fdw-REL-2_3_0 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R mysql_fdw-REL-2_3_0 && \
  
  wget https://codeload.github.com/postgrespro/pg_pathman/zip/1.4.8 && \
  unzip pg_pathman-1.4.8.zip && \
  cd pg_pathman-1.4.8 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R pg_pathman-1.4.8 && \
  
  rm -rf /var/lib/apt/lists/*
