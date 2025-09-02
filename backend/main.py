from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from backend.app.api.v1.api import api_router
from backend.app.core import config

app = FastAPI(
    title=config.APP_NAME,
    openapi_url=f"{config.API_V1_STR}/openapi.json",
    debug=config.DEBUG,
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=config.CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(api_router, prefix=config.API_V1_STR)


def run():
    import uvicorn
    uvicorn.run(
        "backend.main:app",
        host="0.0.0.0",
        port=8000,
        reload=config.DEBUG,
    )


if __name__ == "__main__":
    run()