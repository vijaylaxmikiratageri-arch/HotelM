# Hotel M — Backend API

**Framework**: [FastAPI](https://fastapi.tiangolo.com/)
**Deployment**: [Render](https://render.com)

## Setup

```bash
# Create virtual environment
python -m venv venv

# Activate (Windows)
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Copy env file
cp .env.example .env
# Edit .env with your Neon DATABASE_URL

# Run development server
uvicorn app.main:app --reload --port 8000
```

## API Documentation

Once running, visit:
- Swagger UI: `http://localhost:8000/docs`
- ReDoc: `http://localhost:8000/redoc`

## Project Structure

```
backend/
├── app/
│   ├── __init__.py
│   ├── main.py          # FastAPI app & root router
│   ├── config.py        # Settings & env vars
│   ├── database.py      # DB connection
│   ├── models.py        # SQLAlchemy models
│   └── routes/
│       ├── __init__.py
│       ├── guests.py
│       ├── rooms.py
│       └── bookings.py
├── requirements.txt
├── .env.example
└── README.md
```
