from functools import lru_cache
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    app_name: str = "Hello World API"
    debug: bool = True
    api_v1_str: str = "/api/v1"
    cors_origins: list[str] = ["http://localhost:8501", "http://127.0.0.1:8501"]
    
    class Config:
        env_file = ".env"


@lru_cache()
def get_settings() -> Settings:
    return Settings()