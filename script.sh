#!/usr/bin/env bash

 export image = $1
 docker-compose -f docker-compose.yaml up --detach
 echo "success"