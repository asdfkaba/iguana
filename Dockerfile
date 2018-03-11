FROM python:3
 ENV PYTHONUNBUFFERED 1
 RUN mkdir /code
 WORKDIR /code
 RUN mkdir requirements
 COPY requirements/ requirements/
 RUN pip install -r requirements/production.req && pip install pyScss
 RUN apt-get update
 RUN apt-get install -y postgresql-client
 ADD . /code/
 RUN adduser --disabled-password --gecos '' iguana
 RUN echo "from .global_conf import *" > src/common/settings/__init__.py
 RUN mkdir -p /var/lib/iguana/settings && cp /code/docker/settings.json /var/lib/iguana/settings/settings.json && chown iguana:iguana /var/lib/iguana/settings/settings.json
 RUN chown -R iguana:iguana .
 USER iguana
