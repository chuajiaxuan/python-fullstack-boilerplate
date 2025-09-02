from fastapi import APIRouter

router = APIRouter()


@router.get("/")
async def hello_world():
    return {"message": "Hello World from FastAPI!", "status": "success"}


@router.get("/health")
async def health_check():
    return {"status": "healthy", "message": "API is running perfectly!"}


@router.get("/greet/{name}")
async def greet_person(name: str):
    return {"message": f"Hello {name}!", "name": name}