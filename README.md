# Auth Service

Simple Flask-based authentication service with MySQL and JWT.

## Features
- `POST /login`: validates user credentials from MySQL and returns a JWT.
- `POST /validate`: validates JWT from `Authorization: Bearer <token>`.

## Requirements
- Python 3.10+ (recommended)
- MySQL

## Setup
1. Create and activate a virtual environment.
2. Install dependencies:

```bash
pip install -r requirements.txt
```

Optional dev tools:

```bash
pip install -r requirements-dev.txt
```

## Environment Variables
Create a `.env` file in this directory with:

```env
MYSQL_HOST=localhost
MYSQL_USER=your_user
MYSQL_PASSWORD=your_password
MYSQL_DB=your_db
MYSQL_PORT=3306
JWT_SECRET=your_jwt_secret
```

## Database Initialization
Use `init.sql` as a starting point:
- creates DB user
- creates DB
- grants privileges
- creates `user` table
- inserts a test user with bcrypt hash placeholder

Replace placeholder values before running.

### Run `init.sql` (MySQL CLI)
From this directory:

```bash
mysql -u root -p < init.sql
```

Or specify host/port explicitly:

```bash
mysql -h localhost -P 3306 -u root -p < init.sql
```

### Run `init.sql` (MySQL Workbench)
1. Open `init.sql` in Workbench.
2. Replace placeholder values.
3. Execute the script.
4. Double-click your schema in `SCHEMAS` so it becomes the default DB (bold).
5. If you run table changes manually, run:

```sql
USE <AUTH_DB_NAME>;
```

## Run
```bash
python server.py
```

Service starts on `http://0.0.0.0:5000`.

## API
### `POST /login`
Uses HTTP Basic Auth credentials.

Example:
```bash
curl -X POST http://localhost:5000/login \
  -u user@example.com:password
```

Success response: JWT token string.

### `POST /validate`
Requires Authorization header with Bearer token.

Example:
```bash
curl -X POST http://localhost:5000/validate \
  -H "Authorization: Bearer <jwt_token>"
```

Success response: decoded token payload.

## Notes
- Password verification uses `bcrypt` in `server.py`. Make sure stored passwords are bcrypt hashes.
- Never commit real secrets in `.env`.
