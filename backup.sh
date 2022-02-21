#!/bin/bash
set -x -e

mkdir -p /tmp/dumps

FILENAME="pgdump_$(date +%F_%H-%M).tar.gz"
export PGPASSWORD="$POSTGRES_PASSWORD"

echo Backing up databases to $FILENAME

if [[ -z "${POSTGRES_DATABASES}" ]]; then
    databases=$(psql -U postgres -c "SELECT datname from pg_database" | sed -e '1,2d;$d' | sed -e 's/ //g;$d')
else
    databases=$(echo $POSTGRES_DATABASES | tr "," "\n")
fi

for database in $databases
do
    echo Dumping $database

    pg_dump \
        -U ${POSTGRES_USER:-postgres} \
        -h ${POSTGRES_HOST:-127.0.0.1} \
        -p ${POSTGRES_PORT:-5432} \
        --create \
        --format=c \
        --dbname $database > /tmp/dumps/$database.dump
done


tar cvzf $FILENAME -C /tmp/dumps .

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region ${AWS_DEFAULT_REGION:-eu-central-1}

aws s3 cp --endpoint-url=$AWS_ENDPOINT $FILENAME s3://${AWS_BUCKET}${AWS_BUCKET_PATH:=/}${FILENAME}