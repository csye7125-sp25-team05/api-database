FROM flyway/flyway:11.3.3-alpine

COPY configs/flyway.conf /flyway/conf/flyway.conf
COPY ./migrations/*.* /flyway/sql/

ENTRYPOINT ["flyway", "migrate"]
