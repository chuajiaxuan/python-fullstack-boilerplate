# Python Fullstack Boilerplate 🚀

A production-ready fullstack Python boilerplate with FastAPI backend and Streamlit frontend, following industry best practices.

## 🏗️ Project Structure

```
python-fullstack-boilerplate/
├── backend/                 # FastAPI backend
│   ├── app/
│   │   ├── api/            # API routes
│   │   ├── core/           # Core functionality (config, security)
│   │   ├── models/         # Pydantic models
│   │   └── services/       # Business logic
│   ├── tests/              # Backend tests
│   └── main.py            # FastAPI application entry point
├── frontend/               # Streamlit frontend
│   ├── components/         # Reusable UI components
│   ├── pages/             # Streamlit pages
│   ├── utils/             # Frontend utilities
│   └── main.py           # Streamlit application entry point
├── shared/                # Shared code between frontend/backend
│   ├── models/           # Shared data models
│   └── utils/           # Shared utilities
├── scripts/              # Development and deployment scripts
├── tests/               # Integration tests
└── docs/               # Documentation
```

## 🚀 Quick Start

### Prerequisites
- Python 3.10 or higher
- pip (comes with Python)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd python-fullstack-boilerplate
   ```

2. **Install everything**
   ```bash
   pip install -e .[dev]
   ```

3. **Set up development tools**
   ```bash
   pre-commit install
   ```

4. **Create environment file**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

### Running the Application

#### Development Mode

**Super Simple (recommended for beginners):**
```bash
make setup    # One-time setup
make docker   # Easiest - starts everything with Docker
```

**For Development:**
```bash
# Terminal 1 - API Server
make backend

# Terminal 2 - Web App  
make frontend
```

#### Using Docker

```bash
# Build and run both services
docker compose up --build

# Run in background
docker compose up -d
```

### Access Points
- **Backend API**: http://localhost:8000
- **API Documentation**: http://localhost:8000/docs
- **Frontend App**: http://localhost:8501

## 🛠️ Development

### Code Quality Tools

This project uses several tools to maintain code quality:

- **Ruff**: Fast Python linter and formatter
- **MyPy**: Static type checking
- **Pre-commit**: Git hooks for code quality
- **Pytest**: Testing framework

### Running Code Quality Checks

```bash
# Lint and format code
ruff check .
ruff format .

# Type checking
mypy .

# Run tests
pytest

# Run all checks
pre-commit run --all-files
```

### Project Structure Guidelines

- **backend/**: Contains all FastAPI-related code
- **frontend/**: Contains all Streamlit-related code
- **shared/**: Code shared between frontend and backend
- **tests/**: Comprehensive test suite
- **scripts/**: Utility scripts for development and deployment

## 📚 Key Features

- ✅ **FastAPI Backend**: Modern, fast web framework for building APIs
- ✅ **Streamlit Frontend**: Rapid web app development for data science
- ✅ **Type Safety**: Full type hints with MyPy checking
- ✅ **Code Quality**: Ruff linting and formatting
- ✅ **Testing**: Pytest setup with coverage reporting
- ✅ **Docker Support**: Containerized development and deployment
- ✅ **Pre-commit Hooks**: Automated code quality checks
- ✅ **CORS Configuration**: Frontend-backend communication setup

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
# Application
APP_NAME=Python Fullstack Boilerplate
DEBUG=true

# Database
DATABASE_URL=sqlite:///./app.db

# Security
SECRET_KEY=your-secret-key-change-this-in-production
ACCESS_TOKEN_EXPIRE_MINUTES=30

# CORS
CORS_ORIGINS=["http://localhost:8501"]
```

### Development vs Production

- **Development**: Uses SQLite, debug mode enabled, hot reloading
- **Production**: Configure PostgreSQL, disable debug, use proper secrets

## 🧪 Testing

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=backend --cov=frontend --cov=shared

# Run specific test file
pytest tests/test_api.py

# Run tests in watch mode
pytest-watch
```

## 📦 Package Management

This project uses **pyproject.toml** for modern Python dependency management. Key dependencies:

**Backend:**
- FastAPI: Web framework
- Uvicorn: ASGI server
- Pydantic: Data validation
- SQLAlchemy: Database ORM

**Frontend:**
- Streamlit: Web app framework
- HTTPX: HTTP client for API calls

**Development:**
- Ruff: Linting and formatting
- MyPy: Type checking
- Pytest: Testing
- Pre-commit: Git hooks

## 🚢 Deployment

### Docker Deployment

```bash
# Build images
docker compose build

# Deploy to production
docker compose -f docker-compose.prod.yml up -d
```

### Manual Deployment

1. Set up production environment variables
2. Install dependencies: `pip install -e .`
4. Start backend: `uvicorn backend.main:app --host 0.0.0.0 --port 8000`
5. Start frontend: `streamlit run frontend/main.py --server.address 0.0.0.0`

## 📋 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and code quality checks
5. Submit a pull request

See `docs/BRANCHING_WORKFLOW.md` for detailed git workflow instructions.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
