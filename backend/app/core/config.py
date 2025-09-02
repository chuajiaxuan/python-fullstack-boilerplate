import os
from dotenv import load_dotenv

load_dotenv()

APP_NAME = os.getenv("APP_NAME", "Hello World API")
DEBUG = os.getenv("DEBUG", "true").lower() == "true"
API_V1_STR = os.getenv("API_V1_STR", "/api/v1")

CORS_ORIGINS = [
    "http://localhost:8501",
    "http://127.0.0.1:8501"
]