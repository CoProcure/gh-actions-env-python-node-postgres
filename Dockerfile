FROM nikolaik/python-nodejs:python3.8-nodejs12-alpine

LABEL "com.github.actions.name"="CoProcure GitHub Actions Environment - Node, Python, Postgres"
LABEL "com.github.actions.description"="CoProcure custom environment for running Node, Python, and Postgres"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="black"

# Python
RUN pip install --upgrade pip

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
