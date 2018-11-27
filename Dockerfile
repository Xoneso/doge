FROM lsiobase/alpine:edge
MAINTAINER sauyri84

# install packages
RUN \
 apk add --no-cache \
	ca-certificates \
	curl \
  nodejs \
	python3.6 \
	python3-pip \
	wget && \
  apt-get update && \

  pip3 install pipenv colorama pyopenssl requests tqdm unidecode image bs4 urllib3 flask && \

  # git clone doge and nut
  git clone git://github.com/wowsuchdoge/doge.git /app/doge && \
  git clone git://github.com/blawar/nut.git /app/doge/nut && \
  
  # set work dir
  cd /opt/doge && \
  
  # check if doge.config.json already exists else make a copy
  if [ ! -f doge.config.json ]; then && \
    cp doge.config.default.json doge.config.json && \
  fi && \
  
  # set work dir
  cd /opt/doge/nut/conf && \
  
  # check if nut config exists else make a copy
  if [ ! -f nut.conf ]; then \
    cp nut.default.conf nut.conf \
  fi
  
ENTRYPOINT ["./start.sh"]
