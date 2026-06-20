# Medsol API

## Architecture

- **Routes** -> **Controllers** -> **Services** (via Service Factory) -> **Prisma (DB)**
- `config/` – env, database (Prisma client singleton), logger
- `controllers/` – handle req/res
- `services/` – business logic & DB access
- `factories/` – service factory (centralized instantiation)
- `validations/` – Joi schemas
- `middlewares/` – validation, error handling
- `utils/` – ApiError, catchAsync

## Setup

1. `cp .env.example .env` and update `DATABASE_URL`
2. `npm install`
3. `npm run prisma:generate`
4. `npm run prisma:migrate -- --name init`
5. `npm run dev`

## Scripts

- `npm run dev` – dev server (ts-node + nodemon)
- `npm run build` / `npm start` – production build & run
- `npm run prisma:studio` – Prisma Studio GUI

## API

- `GET /api/v1/health`
- `GET /api/v1/users`
- `GET /api/v1/users/:id`
- `POST /api/v1/users` `{ name, email }`
- `PATCH /api/v1/users/:id`
- `DELETE /api/v1/users/:id`
