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
      "name": "Example",
      "call_or_raise_preflop": "5",
      "call_preflop": "5",
      "call_to_reraise_preflop": "5",
      "fold_on_reraise_preflop": "5",
      "hand_count": "10",
      "raise_preflop": "5",
      "reraise_preflop": "5"
    }
  }'

echo
