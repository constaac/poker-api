#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/players/save"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "player": {
      "name": "Your Boy",
      "hand_count": "4"
    }
  }'

echo
