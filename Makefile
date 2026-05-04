# Makefile for MCP ADK Rust Project

# Use the current python3 from environment
PYTHON_CMD ?= $(shell which python3)

# Environment variables for local development
export GOOGLE_CLOUD_PROJECT ?= $(shell gcloud config get-value project 2>/dev/null)
export GENAI_MODEL = gemini-2.5-flash
export MCP_SERVER_URL = http://localhost:8080

.PHONY: install run-mcp run-agent clean help

help:
	@echo "Available commands:"
	@echo "  install    - Install dependencies for both agent (Python) and MCP server (Rust)"
	@echo "  run-mcp    - Start the Rust MCP server"
	@echo "  run-agent  - Start the Python ADK agent"
	@echo "  clean      - Remove caches and temporary files"

install:
	@echo "Installing Python dependencies for basic_agent..."
	cd basic_agent && $(PYTHON_CMD) -m pip install -r requirements.txt
	@echo "Building Rust MCP server..."
	cd mcp-cloudrun-rust && cargo build

run-mcp:
	@echo "Starting Rust MCP server on port 8080..."
	cd mcp-cloudrun-rust && make run

run-agent:
	@echo "Starting Python ADK agent..."
	cd basic_agent && $(PYTHON_CMD) agent.py

clean:
	@echo "Cleaning up..."
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".adk" -exec rm -rf {} +
	cd mcp-cloudrun-rust && cargo clean
	@echo "Clean completed."
