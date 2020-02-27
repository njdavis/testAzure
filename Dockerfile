FROM python:3.7-alpine

LABEL Name=dfr-docker-azure Version=0.0.1

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

RUN adduser -D appuser
USER appuser
