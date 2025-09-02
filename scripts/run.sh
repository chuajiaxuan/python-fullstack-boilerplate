#!/bin/bash

# 🚀 Python Fullstack Boilerplate - Super Simple Starter
# New to programming? This script makes everything easy!

show_help() {
    echo ""
    echo "🚀 Python Fullstack App - Easy Commands"
    echo ""
    echo "📖 How to use:"
    echo "  ./scripts/run.sh setup     - Install everything (run this first!)"
    echo "  ./scripts/run.sh start     - Start your app"
    echo "  ./scripts/run.sh backend   - Start just the API"
    echo "  ./scripts/run.sh frontend  - Start just the website"
    echo ""
    echo "💡 Tip: Use 'make' commands instead - they're even easier!"
    echo "     make setup"
    echo "     make docker"
    echo ""
}

setup_project() {
    echo "🔧 Setting up your project..."
    
    if ! command -v conda &> /dev/null; then
        echo "❌ Conda is not installed. Please install Anaconda or Miniconda first."
        echo "📥 Download from: https://docs.conda.io/en/latest/miniconda.html"
        exit 1
    fi
    
    echo "🐍 Creating conda environment..."
    conda env create -f environment.yml
    
    echo "📄 Creating config file..."
    if [ ! -f .env ]; then
        cp .env.example .env
        echo "✅ Created .env file"
    fi
    
    echo ""
    echo "🎉 Setup complete!"
    echo "⚠️  IMPORTANT: Run this first:"
    echo "   conda activate python-fullstack-boilerplate"
    echo ""
    echo "Then: ./scripts/run.sh start"
}

start_info() {
    echo ""
    echo "🚀 Ready to start your app!"
    echo ""
    echo "🐳 EASIEST WAY (recommended):"
    echo "   make docker"
    echo ""
    echo "📖 OR open 2 terminals:"
    echo "   Terminal 1: ./scripts/run.sh backend"
    echo "   Terminal 2: ./scripts/run.sh frontend"
    echo ""
    echo "🌐 Your app will be at http://localhost:8501"
}

run_backend() {
    if [ "$CONDA_DEFAULT_ENV" != "python-fullstack-boilerplate" ]; then
        echo "⚠️  Please activate the conda environment first:"
        echo "   conda activate python-fullstack-boilerplate"
        exit 1
    fi
    
    echo "🔧 Starting API server..."
    echo "🌐 API: http://localhost:8000"
    echo "📚 Docs: http://localhost:8000/docs"
    echo ""
    uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000
}

run_frontend() {
    if [ "$CONDA_DEFAULT_ENV" != "python-fullstack-boilerplate" ]; then
        echo "⚠️  Please activate the conda environment first:"
        echo "   conda activate python-fullstack-boilerplate"
        exit 1
    fi
    
    echo "🎨 Starting web app..."
    echo "🌐 App: http://localhost:8501"
    echo ""
    streamlit run frontend/main.py
}

# Simple command handling
case "$1" in
    setup)
        setup_project
        ;;
    start)
        start_info
        ;;
    backend)
        run_backend
        ;;
    frontend)
        run_frontend
        ;;
    "")
        show_help
        ;;
    *)
        echo "❌ Unknown command: $1"
        show_help
        exit 1
        ;;
esac