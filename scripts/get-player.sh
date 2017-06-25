#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/player"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "player": {
      "name": "Example"
    }
  }'

echo
