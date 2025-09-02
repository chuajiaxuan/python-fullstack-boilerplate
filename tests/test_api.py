from fastapi.testclient import TestClient

from backend.main import app

client = TestClient(app)


def test_hello_world():
    response = client.get("/api/v1/")
    assert response.status_code == 200
    data = response.json()
    assert data["message"] == "Hello World from FastAPI!"
    assert data["status"] == "success"


def test_health_check():
    response = client.get("/api/v1/health")
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "healthy"


def test_greet_person():
    response = client.get("/api/v1/greet/Alice")
    assert response.status_code == 200
    data = response.json()
    assert data["message"] == "Hello Alice!"
    assert data["name"] == "Alice"


def test_docs_available():
    response = client.get("/docs")
    assert response.status_code == 200