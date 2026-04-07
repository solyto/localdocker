# localdocker

Docker Compose setup for running the full Solyto stack locally. Not meant to be used standalone — the workspace `Makefile` handles cloning the service repos alongside this one.

## Services

| Service       | Port | Notes                          |
|---------------|------|--------------------------------|
| nginx         | 8000 | Reverse proxy for the API      |
| api           | —    | Laravel backend                |
| app           | 5173 | Vite dev server                |
| landing-page  | 5174 | Vite dev server                |
| mariadb       | —    | Internal only                  |
| postgres      | —    | Internal only                  |
| redis         | —    | Internal only                  |

## Setup

Copy the example env file and adjust as needed:

```sh
cp ' .env.example' .env
```

Then start everything:

```sh
docker compose up -d --build
```

If you're coming from the workspace root, `make install` does all of this for you.

## Env file

The `.env` file is shared across all services. Database credentials, API keys, and service URLs all live here. The example file has working defaults for local development — the only things you'd typically change are external API keys (Telegram, Mailgun, etc.) if you need those integrations running.

## Volumes

Database data is persisted in named volumes (`mariadb_data`, `pg_data`, `redis_data`). To fully reset local state:

```sh
docker compose down -v
```

## Dockerfiles

Each service has its own Dockerfile in this directory rather than in the service repo itself, so local build config stays separate from the application code.
