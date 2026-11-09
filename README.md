# exercicios-orion

Exercícios de Docker do bootcamp Orion (Newrizon).

```
docker/
├── exercicio-1/       Dockerfile + Compose ("Hello from Docker!")
├── exercicio-2/       API + PostgreSQL com volume e variáveis de ambiente
├── exercicio-3/       Dockerfile multi-stage + compose dev/prod
└── exercicio-extra/   API + PostgreSQL + Adminer (healthcheck, rede e volume nomeados)
```

Requisitos: Docker com o plugin Compose. Os comandos abaixo rodam dentro da pasta de cada exercício.

## Exercício 1

```bash
cd docker/exercicio-1
docker compose up --build
curl http://localhost:3000        # Hello from Docker!
```

## Exercício 2

```bash
cd docker/exercicio-2
docker compose up --build -d
curl -X POST localhost:3000/items -H 'Content-Type: application/json' -d '{"name":"teste"}'
curl localhost:3000/items
docker compose down              # o volume pgdata permanece
docker compose up -d
curl localhost:3000/items        # o dado continua lá
```

## Exercício 3

```bash
cd docker/exercicio-3
docker compose -f docker-compose.dev.yml up --build    # http://localhost:3000 (live reload)
docker compose -f docker-compose.prod.yml up --build   # http://localhost:3001 (imagem final, sem volume de código)
```

Cada arquivo tem `name:` próprio, então os dois ambientes não compartilham containers, rede nem volume.

## Exercício extra

```bash
cd docker/exercicio-extra
docker compose up --build -d
curl localhost:3000/health       # {"status":"ok"}
```

Adminer: http://localhost:8080 — sistema **PostgreSQL**, servidor `db`, usuário/senha/banco conforme o `.env`.

## Observações

- O arquivo `.env` está versionado **apenas** porque contém credenciais fictícias de estudo. Em projeto real, versiona-se um `.env.example` e o `.env` vai para o `.gitignore`.
- O live reload usa `node --watch` (nativo do Node 22), dispensando o nodemon.
