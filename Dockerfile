FROM lsiobase/alpine.python3:3.8
MAINTAINER sauyri84

WORKDIR /app/doge
COPY start.sh .
# install packages
RUN \
  chmod +x ./start.sh && \
  apk add --no-cache nodejs && \
  pip3 install pipenv colorama pyopenssl requests tqdm unidecode image bs4 urllib3 flask && \
  mkdir -p {/app/doge,/app/doge/nut} && \
  # git clone doge and nut
  git clone git://github.com/wowsuchdoge/doge.git /app/doge && \
  git clone git://github.com/blawar/nut.git /app/doge/nut
  
ENTRYPOINT ["./start.sh"]
