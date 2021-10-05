FROM alpine

RUN apk update
RUN apk add --no-cache postgresql-client aws-cli

ADD backup.sh /usr/local/bin/backup

RUN ["chmod", "+x", "/usr/local/bin/backup"]

CMD sh /usr/local/bin/backup