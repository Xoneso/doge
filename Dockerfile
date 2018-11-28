FROM lsiobase/alpine.python3:3.8
MAINTAINER sauyri84

# install packages
RUN \
  apk add --no-cache curl nodejs wget && \
  pip3 install pipenv colorama pyopenssl requests tqdm unidecode image bs4 urllib3 flask && \
  # git clone doge and nut
  git clone git://github.com/wowsuchdoge/doge.git /app/doge
RUN \
  git clone git://github.com/blawar/nut.git /app/doge/nut && \
  chmod +x ./app/doge/start.sh

WORKDIR /app/doge
ENTRYPOINT ["./app/doge/start.sh"]
