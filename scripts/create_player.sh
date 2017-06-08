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
      "name": "not acon",
      "user_id": "2"
    }
  }'

echo
