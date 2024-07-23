FROM nginx

RUN apt-get update -y
RUN apt-get install git -y

WORKDIR /.

COPY . /bole

ENV PORT 80

