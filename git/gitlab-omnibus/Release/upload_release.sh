#!/bin/bash
#
# song@20190829
#
RELEASE_NAME=$1
TAG_NAME=$2
PROJECT_ID=$3
DESCRIPTION_FILE_PATH=$4
PRIVATE_TOKEN=$5

if [[ $5 == "" ]]; then
    echo "Missing parameter! Parameters are RELEASE_NAME, TAG_NAME, PROJECT_ID, DESCRIPTION_FILE_PATH and PRIVATE_TOKEN."
    exit 1
fi

DESCRIPTION=''

# Load description from file
while read -r line; do
    DESCRIPTION="${DESCRIPTION}${line}\n"
done < ${DESCRIPTION_FILE_PATH}

echo "DESCRIPTION:\n"
echo ${DESCRIPTION}"\n"

curl --header 'Content-Type: application/json'\
     --header "PRIVATE_TOKEN: ${PRIVATE_TOKEN}"\
     --data-binary "{\"name\": \"${RELEASE_NAME}\", \"tag_name\": \"${TAG_NAME}\", \"description\": \"${DESCRIPTION}\"}"\
     --request POST "http://127.0.0.1:80/api/v4/projects/${PROJECT_ID}/releases"

echo

