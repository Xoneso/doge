FROM lsiobase/alpine.python3:3.8
MAINTAINER sauyri84

WORKDIR /app/doge

# install packages
RUN \
  apk add --no-cache nodejs && \
  pip3 install pipenv colorama pyopenssl requests tqdm unidecode image bs4 urllib3 flask && \
  # git clone doge and nut
  git clone git://github.com/wowsuchdoge/doge.git /app/doge && \
  git clone git://github.com/blawar/nut.git /app/doge/nut
#COPY start.sh doge  
RUN chmod +x ./start.sh 
ENTRYPOINT ["./start.sh"]
