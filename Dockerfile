FROM postgres:10

## pgbench scripts
COPY run.sh test.sh /
RUN chmod +x ./run.sh

## hammerdb tools
COPY hammerdb hammerdb
RUN chmod +x hammerdb/hammerdb.sh

ENTRYPOINT [ "/run.sh" ]
