"""
Hotel M — FastAPI Application Entry Point
"""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.config import get_settings
from app.routes import guests, rooms, bookings, auth

settings = get_settings()

app = FastAPI(
    title="Hotel M API",
    description="Backend API for Hotel Management System",
    version="1.0.0",
)

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origins.split(","),
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include route modules
app.include_router(guests.router, prefix="/api/guests", tags=["Guests"])
app.include_router(rooms.router, prefix="/api/rooms", tags=["Rooms"])
app.include_router(bookings.router, prefix="/api/bookings", tags=["Bookings"])
app.include_router(auth.router, prefix="/api/auth", tags=["Auth"])


@app.get("/", tags=["Root"])
async def root():
    return {"message": "Welcome to Hotel M API", "docs": "/docs"}


@app.get("/health", tags=["Health"])
async def health_check():
    return {"status": "healthy"}
