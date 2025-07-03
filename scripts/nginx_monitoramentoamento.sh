#!/bin/bash

NGINX_URL="http://localhost"
DISCORD_WEBHOOK="LINK_DO_SEU_WEEBHOOK"
LOG_DIR="/var/log/"
LOG_FILE="$LOG_DIR/nginx-monitoramento.log"
ORIGEM="EC2"

mkdir -p "$LOG_DIR"

if curl -s -I "$NGINX_URL" | grep -q "200 OK"; then
	echo "[$ORIGEM] Servidor Nginx ONLINE - $(date '+%d/%m %H:%M')" >> "$LOG_FILE"
else
    	STATUS="[$ORIGEM] Servidor Nginx OFFLINE - $(date '+%d/%m %H:%M')"
	echo "$STATUS" >> "$LOG_FILE"
fi

echo "$STATUS" >> "$LOG_FILE"

curl -sS -H "Content-Type: application/json" -X POST \
    	-d "{\"content\":\"$STATUS\"}" "$DISCORD_WEBHOOK" \
    	|| echo "[ERRO] Falha ao enviar para Discord - $(date '+%d/%m %H:%M')" >> "$LOG_FILE"
