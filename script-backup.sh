#!/bin/bash

DB_USER="" # Usuário DB
DB_PASS="" # Senha DB
DB_NAME="" # Nome da DB
ZABBIX_CONFIG_DIR="/etc/zabbix" # Confirme o diretório

GRAFANA_CONFIG_DIR="/etc/grafana" # Confirme o diretório
GRAFANA_DATA_DIR="/var/lib/grafana" # Confirme o diretório

BACKUP_ROOT_DIR="" # Diretório do backup
DATE=$(date +%Y-%m-%d)
BACKUP_DIR="$BACKUP_ROOT_DIR/$DATE"

mkdir -p "$BACKUP_DIR"

systemctl stop zabbix-server

# ZABBIX BACKUP
mysqldump -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/zabbix_backup_$DATE.sql"
cp -r "$ZABBIX_CONFIG_DIR" "$BACKUP_DIR/zabbix_config_$DATE"

systemctl start zabbix-server

systemctl stop grafana-server

# GRAFANA BACKUP
cp -r "$GRAFANA_CONFIG_DIR" "$BACKUP_DIR/grafana_config_$DATE"
cp -r "$GRAFANA_DATA_DIR" "$BACKUP_DIR/grafana_data_$DATE"

systemctl start grafana-server
