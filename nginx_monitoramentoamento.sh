#!/bin/bash

NGINX_URL="http://localhost"
DISCORD_WEBHOOK="URL_DO_SEU_WEBHOOK"
LOG_DIR="/var/log/nginx-monitoramento"
LOG_FILE="$LOG_DIR/status.log"

if curl -s -I "$NGINX_URL" | grep -q "200 OK"; then
	STATUS="Servidor Nginx ONLINE - $(date '+%d/%m/%Y %H:%M:%S')"
	echo "$STATUS" >> "$LOG_FILE"
else
	STATUS="Servidor Nginx OFFLINE - $(date '+%d/%m/%Y %H:%M:%S')"
	echo "$STATUS" >> "$LOG_FILE"

	curl -H "Content-Type: application/json" -X POST -d '{
		"content": "'"$STATUS"'",
		"flags": 4
	}' "$DISCORD_WEBHOOK"

	sudo systemctl restart nginx

fi

echo "$STATUS" >> "$LOG_FILE"

curl -H "Content-Type: application/json" -X POST -d "{\"content\":\"$STATUS\"}" "$DISCORD_WEBHOOK"
