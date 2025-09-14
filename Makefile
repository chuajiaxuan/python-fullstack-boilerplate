# 🚀 Python Fullstack Boilerplate - Simple Commands
# New to this? Just type 'make' to see what you can do!

help: ## 📖 Show all available commands
	@echo ""
	@echo "🚀 GETTING STARTED (run these in order):"
	@echo "  make setup     - Install everything you need"
	@echo "  make start     - Start the app"
	@echo ""
	@echo "🔧 DEVELOPMENT:"
	@echo "  make backend   - Start just the API server"
	@echo "  make frontend  - Start just the web app"
	@echo "  make test      - Run tests to check if code works"
	@echo "  make fix       - Fix code style automatically"
	@echo ""
	@echo "🐳 DOCKER (easiest way):"
	@echo "  make docker    - Start everything with Docker"
	@echo ""
	@echo "🧹 MAINTENANCE:"
	@echo "  make clean     - Clean up temporary files"
	@echo ""

setup: ## 🔧 Install everything needed (run this first!)
	@echo "📦 Installing Python packages..."
	pip install -e .[dev]
	@echo "🔗 Setting up code quality tools..."
	pre-commit install
	@echo "📄 Creating settings file..."
	@if [ ! -f .env ]; then cp .env.example .env; echo "✅ Created .env file"; fi
	@echo ""
	@echo "🎉 Setup complete! Next: make start"

start: ## 🚀 Start the app (you need 2 terminals)
	@echo ""
	@echo "🚀 Ready to start your app!"
	@echo ""
	@echo "📖 Open 2 terminals and run:"
	@echo "   Terminal 1: make backend"
	@echo "   Terminal 2: make frontend"
	@echo ""
	@echo "🐳 OR use Docker (easier): make docker"
	@echo ""
	@echo "🌐 Your app will be at:"
	@echo "   • Frontend: http://localhost:8501"
	@echo "   • API: http://localhost:8000"

backend: ## 🔧 Start the API server (Terminal 1)
	@echo "🔧 Starting API server at http://localhost:8000"
	uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000

frontend: ## 🎨 Start the web app (Terminal 2)
	@echo "🎨 Starting web app at http://localhost:8501"
	streamlit run frontend/main.py

test: ## 🧪 Run tests to check if everything works
	@echo "🧪 Running tests..."
	pytest

fix: ## 🔧 Fix code style automatically
	@echo "🔧 Fixing code style..."
	ruff format .
	@echo "✅ Code formatted!"

check: ## ✅ Check code quality (like a final review)
	@echo "✅ Checking code quality..."
	ruff check .
	mypy .
	pytest
	@echo "🎉 All checks passed!"

docker: ## 🐳 Start everything with Docker (easiest!)
	@echo "🐳 Starting app with Docker..."
	@echo "🌐 Will be available at:"
	@echo "   • Frontend: http://localhost:8501"  
	@echo "   • API: http://localhost:8000"
	docker compose up --build

docker-stop: ## 🛑 Stop Docker
	docker compose down

clean: ## 🧹 Clean up temporary files
	@echo "🧹 Cleaning up..."
	find . -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
	find . -name "*.pyc" -delete 2>/dev/null || true
	rm -rf .pytest_cache .mypy_cache .ruff_cache 2>/dev/null || true
	@echo "✅ Cleaned up!"

# Default target when someone just types 'make'
.DEFAULT_GOAL := help