#!/bin/bash

DB_USER="" # Usuário
DB_PASS="" # Senha
DB_NAME="" # Nome da DB
ZABBIX_CONFIG_DIR="/etc/zabbix" 

GRAFANA_CONFIG_DIR="/etc/grafana"
GRAFANA_DATA_DIR="/var/lib/grafana"

BACKUP_ROOT_DIR="" # Diretório do backup
DATE=$(date +%Y-%m-%d)
BACKUP_DIR="$BACKUP_ROOT_DIR/$DATE"

mkdir -p "$BACKUP_DIR"

# ZABBIX BACKUP
mysqldump -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/zabbix_backup_$DATE.sql"
cp -r "$ZABBIX_CONFIG_DIR" "$BACKUP_DIR/zabbix_config_$DATE"

# GRAFANA BACKUP
cp -r "$GRAFANA_CONFIG_DIR" "$BACKUP_DIR/grafana_config_$DATE"
cp -r "$GRAFANA_DATA_DIR" "$BACKUP_DIR/grafana_data_$DATE"
