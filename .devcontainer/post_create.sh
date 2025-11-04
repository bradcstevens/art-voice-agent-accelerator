#!/bin/bash

# Define the path to your shell profiles
zshrc_path="$HOME/.zshrc"
bashrc_path="$HOME/.bashrc"

echo "🚀 Setting up development environment..."

# Add local bin to PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$zshrc_path"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$bashrc_path"

# Source the current path
export PATH="$HOME/.local/bin:$PATH"

echo "📦 Installing system dependencies..."
# Install PortAudio and other required system libraries
sudo apt-get update
sudo apt-get install -y portaudio19-dev

echo "📦 Installing Bicep CLI..."
# Install Bicep CLI
curl -Lo bicep https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64
chmod +x ./bicep
sudo mv ./bicep /usr/local/bin/bicep

echo "🐍 Setting up Python environment with uv..."
# Sync Python dependencies using uv and pyproject.toml
uv sync --dev

# Display helpful commands
echo ""
echo "📋 Useful commands:"
echo "  uv run rtagent-server          # Run main orchestrator"
echo "  uv run pytest                  # Run tests"
echo "  uv run hatch run lint          # Run linting"
echo "  uv run hatch run format        # Format code"
echo "  uv run hatch run quality       # Run all quality checks"
echo "  az login                       # Login to Azure"
echo "  azd init                       # Initialize Azure Developer CLI"
