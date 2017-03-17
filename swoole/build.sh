#!/usr/bin/env bash
myFile="/opt/web/k12_swoole/src/_opt_web_k12_swoole_start_swoole_server.php.pid"
if [  -f "$myFile" ]; then
rm "$myFile"
fi
php /opt/web/k12_swoole/start_swoole_server.php start



