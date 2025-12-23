#!/bin/bash

# FHIRパッケージキャッシュを完全クリア（アトミック削除エラー回避）
# IG Publisherが起動時にキャッシュをクリアしようとして失敗するため、
# 事前に全てのパッケージを削除し、必要なものだけを保持する
echo "Clearing FHIR package cache to avoid atomic delete errors..."
rm -rf /root/.fhir/packages/hl7.fhir.uv.*
rm -rf /root/.fhir/packages/hl7.terminology.*
rm -rf /root/.fhir/packages/*.lock
rm -rf /root/.fhir/packages/packages.ini
find /root/.fhir/packages -name "*.lock" -delete 2>/dev/null || true
find /root/.fhir/packages -type d -name "#*" -exec rm -rf {} + 2>/dev/null || true

cd /repository
bash _updatePublisher.sh -y

echo "Running IG Publisher..."
export JAVA_TOOL_OPTIONS='-Xmx4g -Xms512m -Dfile.encoding=UTF-8'
bash _genonce.sh

if [ $? -ne 0 ]; then
  echo "An error occurred. Please check the process."
else
  echo "Compilation completed successfully. Exiting."
fi
