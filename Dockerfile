# Run a salt-ssh in a container.
#
# docker run --rm -it -v $(pwd)/roster:/etc/salt/roster jweinstock/salt-ssh
#
# Run salt-ssh commands:
# salt-ssh 'entry_in_roster' -i state.apply docker
FROM alpine:3.6
LABEL maintainer "Jacob Weinstock <jakobweinstock@gmail.com>"

ENV DEPS salt-ssh==2018.3.1 pyopenssl==18.0.0

# install musl-dev gcc as dependencies for installing gevent
RUN apk --no-cache --update add python2=2.7.14-r0 openssl openssh py2-pip \
 && apk add --virtual build-dependencies python2-dev=2.7.14-r0 musl-dev gcc libffi-dev openssl-dev \
 && pip install --no-cache-dir ${DEPS} \
 && apk --purge del build-dependencies \
 && rm -rf /var/cache/apk/* /root/.cache

ADD ./Saltfile /
ADD ./srv/ /srv/

CMD ["/bin/sh"]