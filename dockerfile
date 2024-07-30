FROM nginx

RUN apt-get update -y
RUN apt-get install git -y
RUN apt get install npm -y

WORKDIR /.

COPY . /bole

ENV PORT 80

