FROM alpine

RUN apk update
RUN apk add --no-cache postgresql-client aws-cli bash curl

ADD backup.sh /usr/local/bin/backup

RUN ["chmod", "+x", "/usr/local/bin/backup"]

CMD bash /usr/local/bin/backup