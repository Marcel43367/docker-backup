FROM alpine:edge

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --update build-base ruby ruby-dev libxml2-dev mongodb-tools redis gpgme tzdata && \
    gem install nokogiri -v 1.6.8 --no-document && \
    gem install backup whenever --no-document && \
    apk del build-base ruby-dev libxml2-dev
ADD run /
ADD schedule.rb /config/schedule.rb
ADD config.rb /root/Backup/config.rb
RUN chmod u+x /run

CMD /run
