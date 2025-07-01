#!/bin/bash

NGINX_URL="http://localhost"
DISCORD_WEBHOOK="URL_DO_SEU_WEBHOOK"
LOG_DIR="/var/log/"
LOG_FILE="$LOG_DIR/nginx-monitoramento.log"
ORIGEM="WSL"

if curl -s -I "$NGINX_URL" | grep -q "200 OK"; then
        echo "[$ORIGEM] Servidor Nginx ONLINE - $(date '+%d/%m %H:%M')" >> "$LOG_FILE"
else
        STATUS="[$ORIGEM] Servidor Nginx OFFLINE - $(date '+%d/%m %H:%M')\nIP: $(curl -s ifconfig.me)"
        echo "$STATUS" >> "$LOG_FILE"
fi

echo "$STATUS" >> "$LOG_FILE"

curl -H "Content-Type: application/json" -X POST -d "{\"content\":\"$STATUS\"}" "$DISCORD_WEBHOOK"
