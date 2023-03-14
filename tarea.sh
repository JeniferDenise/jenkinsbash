#!/bin/bash


export token=$(curl --location 'https://xray.cloud.getxray.app/api/v2/authenticate' \
--header 'Content-Type: application/json' \
--data '{ "client_id": "ACB6E49CA6C24E178A0AEB331D176B5F","client_secret": "91080ee36fe40593e52989031803984f5f7711246fa0400b13fa39d7bb8ac72f" }'|tr -d '"')

echo $token

curl --location 'https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart' \
--header 'Content-Type: multipart/form-data' \
--header "Authorization: Bearer $token" \
--form info=@"info.json" \
--form results=@"Cucumberprueba.json">peticion.txt
export key=$(grep "IXR" peticion.txt | cut -d '"' -f 8)

echo $key

curl --location -g "https://integracionx-ray.atlassian.net/rest/api/3/issue/$key/attachments" \
--header 'X-Atlassian-Token: no-check' \
--header 'Authorization: Basic amVuaWZlci5lc3BlY2hlQHRzb2Z0bGF0YW0uY29tOkFUQVRUM3hGZkdGMGRsb0VFY1FpNkl1VENZcU5XdzdMV0lQSFd5SWxEMjRYdDhPbW9SSU1LQ1RZN1N4cHIxT2hHQlZacWpiNnFaTlk1c0NEOVcydlR2REJpUnlHeFduSTlTRDBCbjRGUTVCTDRlSTEwTkZMdU13dkNyR3dvNWJ6cV8xWEdtRU8xZ0xKTmMtRFZCcmJqOHhQZ0FRNW1fV2hJQTBtQ2tDVzhmTmgxMExwT24tY1d2OD1DREU2QUIzMQ==' \
--form file=@"reporteQA.pdf"
