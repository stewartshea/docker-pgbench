FROM postgres:10

COPY run.sh test.sh /

ENTRYPOINT [ "/run.sh" ]
