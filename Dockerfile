FROM ubuntu:16.04


## supress errors
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y python


ADD index.py /index.py

EXPOSE 8080


ENTRYPOINT ["python","/index.py"]
