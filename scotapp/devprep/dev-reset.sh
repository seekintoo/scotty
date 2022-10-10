#!/bin/bash

mongo "mongodb://mongoadmin:mongoadmin@192.168.49.2:30484/scot-prod?authSource=admin" dev-reset.js
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/alertgroup"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/handler"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/apikey"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/signature"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/entry"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/entitytype"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/alert"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/audit"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/event"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/incident"
curl -k -X DELETE "https://admin:admin@192.168.49.2:32006/entity"