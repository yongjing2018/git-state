#!/bin/sh

SRC='../src/collect'
cd ${SRC}
sh ./collect.sh 'api-portal' '/home/project/supplychain/api-portal/'
sh ./collect.sh 'supplychain-service' '/home/project/supplychain/supplychain-service/'
