# Hotel M — Database

**Provider**: [Neon](https://neon.tech) (Serverless PostgreSQL)

## Setup

1. Create a Neon project at [console.neon.tech](https://console.neon.tech)
2. Copy the connection string from the Neon dashboard
3. Create `.env` from the template:
   ```bash
   cp .env.example .env
   ```
4. Paste your connection string into `.env`

## Running Schema

```bash
psql "$DATABASE_URL" -f schema.sql
```

## Seeding Data

```bash
psql "$DATABASE_URL" -f seed.sql
```

## Migrations

Migration scripts live in `migrations/` and should be numbered sequentially:
- `001_initial_schema.sql`
- `002_add_bookings.sql`
- etc.
