#!/bin/bash

NGINX_URL="http://localhost"
DISCORD_WEBHOOK="URL_DO_SEU_WEBHOOK"
LOG_DIR="/var/log/"
LOG_FILE="$LOG_DIR/nginx-monitoramento.log"

if curl -s -I "$NGINX_URL" | grep -q "200 OK"; then
	echo "Servidor Nginx ONLINE - $(date '+%d/%m/%Y %H:%M:%S')" >> "$LOG_FILE"
else
	STATUS="Servidor Nginx OFFLINE - $(date '+%d/%m/%Y %H:%M:%S')"
	echo "$STATUS" >> "$LOG_FILE"
	sudo systemctl restart nginx
fi

echo "$STATUS" >> "$LOG_FILE"

curl -H "Content-Type: application/json" -X POST -d "{\"content\":\"$STATUS\"}" "$DISCORD_WEBHOOK"
