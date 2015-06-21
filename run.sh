#!/bin/bash
require_env=(
MYSQL_PORT_3306_TCP_ADDR
MYSQL_PORT_3306_TCP_PORT
REDIS_PORT_6379_TCP_ADDR
REDIS_PORT_6379_TCP_PORT
SCRIBE_PORT_1463_TCP_ADDR
SCRIBE_PORT_1463_TCP_PORT
DB_USER
DB_PWD
DB_NAME
DOMAIN
)
for i in ${require_env[@]}; do
    if [ x${!i} == 'x' ]; then
        echo "Need env ${i}"
        exit 1;
    fi
done
confFile=$GOPATH/src/github.com/dinp/server/cfg.json
sed -i "s/{DB_HOST}/${MYSQL_PORT_3306_TCP_ADDR}/g" $confFile \
&& sed -i "s/{DB_PORT}/${MYSQL_PORT_3306_TCP_PORT}/g" $confFile \
&& sed -i "s/{DB_USER}/${DB_USER}/g" $confFile \
&& sed -i "s/{DB_NAME}/${DB_NAME}/g" $confFile \
&& sed -i "s/{DB_PWD}/${DB_PWD}/g" $confFile \
&& sed -i "s/{REDIS_HOST}/${REDIS_PORT_6379_TCP_ADDR}/g" $confFile \
&& sed -i "s/{REDIS_PORT}/${REDIS_PORT_6379_TCP_PORT}/g" $confFile \
&& sed -i "s/{SCRIBE_HOST}/${SCRIBE_PORT_1463_TCP_ADDR}/g" $confFile \
&& sed -i "s/{SCRIBE_PORT}/${SCRIBE_PORT_1463_TCP_PORT}/g" $confFile \
&& sed -i "s/{DOMAIN}/${DOMAIN}/g" $confFile

cd $GOPATH/src/github.com/dinp/server/
./server
