FROM nikolaik/python-nodejs:python3.8-nodejs12-alpine

LABEL "com.github.actions.name"="CoProcure GitHub Actions Environment - Node, Python, Postgres"
LABEL "com.github.actions.description"="CoProcure custom environment for running Node, Python, and Postgres"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="black"

# Python
RUN pip install --upgrade pip

# Postgres
RUN apk add postgresql=11.6-r0
RUN (addgroup -S postgres && adduser -S postgres -G postgres || true)
RUN mkdir -p /var/lib/postgresql/data
RUN mkdir -p /run/postgresql/
RUN chown -R postgres:postgres /run/postgresql/
RUN chmod -R 777 /var/lib/postgresql/data
RUN chown -R postgres:postgres /var/lib/postgresql/data
RUN su - postgres -c "initdb /var/lib/postgresql/data"
RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf
RUN su - postgres -c "pg_ctl start -D /var/lib/postgresql/data -l /var/lib/postgresql/log.log && psql --command \"ALTER USER postgres WITH ENCRYPTED PASSWORD 'CoProcure!';\" && psql --command \"CREATE DATABASE data_pipeline;\""

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]