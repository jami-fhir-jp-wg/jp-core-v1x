#!/bin/bash
cd /repository
bash _updatePublisher.sh -y

echo "Running IG Publisher..."
export JAVA_TOOL_OPTIONS='-Xmx8g -Xms1g -Dfile.encoding=UTF-8'
bash _genonce.sh

if [ $? -ne 0 ]; then
  echo "An error occurred. Please check the process."
else
  echo "Compilation completed successfully. Exiting."
fi
