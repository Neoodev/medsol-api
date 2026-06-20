# ── Stage 1: Build ──────────────────────────────────────────────────────
FROM node:22-alpine AS builder

RUN apk add --no-cache openssl

WORKDIR /app

# Install ALL deps (including dev) — needed for tsc, prisma generate
COPY package*.json ./
# Prisma needs the schema present before `generate` will work

COPY prisma ./prisma/
RUN npm ci


# Now bring in the rest of the source and compile
COPY . .
RUN npm run build

# ── Stage 2: Production runtime ──────────────────────────────────────────
FROM node:22-alpine AS runner

RUN apk add --no-cache openssl

WORKDIR /app

ENV NODE_ENV=production

# Install ONLY production deps — smaller image, no tsc/eslint/etc.
# --ignore-scripts: skips `postinstall` (which runs `prisma generate`),
# since the `prisma` CLI itself is a devDependency and won't be present
# here. The generated client is copied from the builder stage instead.
COPY package*.json ./
RUN npm ci --omit=dev --ignore-scripts

# Bring over the generated Prisma client, compiled JS, schema, and the
# Prisma CLI itself (needed at runtime for `prisma migrate deploy` — it's
# a devDependency so it isn't installed by the --omit=dev step above).
COPY --from=builder /app/node_modules/.prisma ./node_modules/.prisma
COPY --from=builder /app/node_modules/prisma ./node_modules/prisma
COPY --from=builder /app/node_modules/.bin/prisma ./node_modules/.bin/prisma
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma

EXPOSE 3000

# Apply pending migrations, then start the server.
# (Docker mode has no separate pre-deploy hook on Render free tier,
# so this has to happen at container start instead.)
CMD ["npm", "startß"]