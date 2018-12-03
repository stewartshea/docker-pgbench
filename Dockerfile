FROM postgres:10
RUN apt-get install tcl


## pgbench scripts
COPY run.sh test.sh /
RUN chmod +x ./run.sh

## hammerdb tools
COPY hammerdb hammerdb
RUN chmod +x hammerdb/hammerdb.sh

ENTRYPOINT [ "/run.sh" ]
