#!/bin/sh
docker-compose -f docker-compose.yml -f docker-compose.mysql.yml -f docker-compose.phpadmin.yml up -d --build