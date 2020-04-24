# CoProcure GitHub Actions Environment - Node, Python, Postgres
Github Actions step environment with Node, Python, and Postgres.

### Usage

```yml
- name: CoProcure GitHub Actions Environment - Node, Python, Postgres
  uses: coprocure/gh-actions-env-python-node-postgres@master
  with:
    args: pip3 install -r requirements.txt && npm ci && npm test
```
