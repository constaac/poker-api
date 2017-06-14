#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/players"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "player": {
      "name": "Not Acon"
    }
  }'

echo
