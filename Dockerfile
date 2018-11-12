FROM postgres:10

COPY run.sh run.sh

ENTRYPOINT [ "/run.sh" ]
