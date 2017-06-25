# Poker Tracker API

A Rails API that handles User Authentication and storing 'Players' assocaited to a user.

API Link - https://pokertracker.herokuapp.com

## Structure

This template follows the standard project structure in Rails 4.

`curl` command scripts are stored in [`scripts`](scripts) with names that
correspond to API actions.

## API

This API handles Authentication and storing 'Players'

Scripts are included in [`scripts`](scripts) to test built-in actions.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sign-up"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "name": "'"${NAME}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah NAME=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "name": "hannah"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "name": "hannah",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=<token> scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Players

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/players`             | `players#index`   |
| POST   | `/players/create`      | `players#create`  |
| PATCH  | `/player`              | `players#show`    |
| PATCH  | `/players/save`        | `players#update`  |
| DELETE | `/players/:id`         | `players#destroy` |

#### GET /players

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/players"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=<token> scripts/get-players.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "players":[]
}
```

#### POST /players/create

Only fires on frontend the first time the user sits at a table.

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/players/create"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "player": {
      "name": "Example"
    }
  }'
```

```sh
TOKEN=<token> scripts/create_user_player.sh
```

Response:

```md
HTTP/1.1 201 CREATED
Content-Type: application/json; charset=utf-8

{
  "player":{
    "id":1,
    "name":"Example",
    "hand_count":0,
    "call_preflop":0,
    "raise_preflop":0,
    "call_or_raise_preflop":0,
    "reraise_preflop":0,
    "call_to_reraise_preflop":0,
    "fold_on_reraise_preflop":0
    }
}
```

#### PATCH /player

Request:

```sh
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
```

```sh
TOKEN=<token> scripts/get-player.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "player":{
    "id":1,
    "name":"Example",
    "hand_count":0,
    "call_preflop":0,
    "raise_preflop":0,
    "call_or_raise_preflop":0,
    "reraise_preflop":0,
    "call_to_reraise_preflop":0,
    "fold_on_reraise_preflop":0
    }
}
```

#### /players/save

Request:

```sh
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
```

```sh
TOKEN=<token> scripts/save_player.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "player":{
    "id":1,
    "name":"Example",
    "hand_count":10,
    "call_preflop":5,
    "raise_preflop":5,
    "call_or_raise_preflop":5,
    "reraise_preflop":5,
    "call_to_reraise_preflop":5,
    "fold_on_reraise_preflop":5
    }
}
```

#### DELETE /players/:id

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/players/1"
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN=<token> scripts/delete_player.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
