#!/usr/bin/env bash
set -euo pipefail

DB_PASS=$(aws ssm get-parameter --name "${SSM_DB_PASS_PARAM:-/taskapp/db/password}" --with-decryption --query Parameter.Value --output text)

exec /usr/bin/java ${JAVA_OPTS:-} -jar /opt/taskapp/backend/app.jar \
  --spring.datasource.url="${SPRING_DATASOURCE_URL}" \
  --spring.datasource.username="${SPRING_DATASOURCE_USERNAME:-taskuser}" \
  --spring.datasource.password="${DB_PASS}"
