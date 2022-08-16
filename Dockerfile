
FROM python:3.9-alpine3.13
LABEL maintainer="alisherkat.ir"
ENV PYTHONONBUFFERED 1
COPY ./requirements.txt ./tmp/requirements.txt
COPY ./requirements.dev.txt ./tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app

EXPOSE 8000

ARG DEV=false

RUN pip install --upgrade pip && \
     apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev && \
        pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    apk del .tmp-build-deps &&\
    rm -rf /tmp &&\
    adduser \
        --disabled-password\
    --no-create-home\
    ali

USER ali

