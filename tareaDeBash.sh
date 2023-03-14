#!/bin/bash
curl --location 'https://zephyrscalepruebas.atlassian.net/rest/api/3/issue' \
--header 'Authorization: Basic amVuaWZlci5lc3BlY2hlQHRzb2Z0bGF0YW0uY29tOkFUQVRUM3hGZkdGMGRsb0VFY1FpNkl1VENZcU5XdzdMV0lQSFd5SWxEMjRYdDhPbW9SSU1LQ1RZN1N4cHIxT2hHQlZacWpiNnFaTlk1c0NEOVcydlR2REJpUnlHeFduSTlTRDBCbjRGUTVCTDRlSTEwTkZMdU13dkNyR3dvNWJ6cV8xWEdtRU8xZ0xKTmMtRFZCcmJqOHhQZ0FRNW1fV2hJQTBtQ2tDVzhmTmgxMExwT24tY1d2OD1DREU2QUIzMQ==' \
--header 'Content-Type: application/json' \
--data '{
    "fields": {
        "project": {
            "id": "10000"
        },
        "issuetype": {
            "id": "10004"
        },
        "summary": "Jeni",
        "components": [],
        "reporter": {
            "id": "6285035e0dae78006807fb47"
        },
        "fixVersions": [],
        "priority": {
            "id": "3",
            "name": "Medium",
            "iconUrl": "https://zephyrscalepruebas.atlassian.net/images/icons/priorities/medium.svg"
        },
        "labels": []
    },
    "update": {}
}'>info2.txt

echo "hola como est'as " >hola.txt

export key=$(grep "ZS-" info2.txt | cut -d '"' -f 8)

echo "La key obtenida es: $key"