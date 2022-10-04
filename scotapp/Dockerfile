FROM docker.io/library/perl:5.22-buster

ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
RUN echo "deb http://ppa.launchpad.net/maxmind/ppa/ubuntu xenial main" >> /etc/apt/sources.list
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys DE742AFA
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

RUN apt-get update
RUN apt-get install -qy libmagic-dev libgeoip-dev libmaxminddb0 libmaxminddb-dev mmdb-bin pwgen mongodb-org-shell mongodb-org-tools 

RUN curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | perl - install -g App::cpm
RUN cpm install -v -g Carton::Snapshot

RUN groupadd -g 2060 scot && \
    useradd -s /bin/bash -r -m -u 1060 -g scot scot

RUN echo "export PATH=/home/scot/local/bin:${PATH}" >> /home/scot/.bashrc
RUN echo "export PERL5LIB=/home/scot/lib:/home/scot/local/lib/perl5" >> /home/scot/.bashrc

COPY . /home/scot/
RUN chown -R scot:scot /home/scot/
RUN chmod -R 0777 /tmp/

USER scot
WORKDIR /home/scot

RUN cpm install -v

EXPOSE 3000

RUN mkdir logs

#ENTRYPOINT ["/bin/bash", "-l", "-c"]
ENTRYPOINT ["hypnotoad", "-f", "Scot.pl"]