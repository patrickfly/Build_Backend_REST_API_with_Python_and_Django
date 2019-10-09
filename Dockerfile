FROM python:3.7-alpine
MAINTAINER Egor Kostan

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN apt-get update \
    apt-get upgrade \
    apt-get install git

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user