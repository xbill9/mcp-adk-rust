# MCP ADK Rust Project

This project demonstrates a Python agent built with the **Agent Development Kit (ADK)** interacting with a Rust-based **Model Context Protocol (MCP)** server.

## Project Structure

- `basic_agent/`: A Python-based ADK agent that uses the Gemini model and connects to an MCP server.
- `mcp-cloudrun-rust/`: A Rust-based MCP server that exposes a `greeting` tool.

## Getting Started

### 1. Start the MCP Server (Rust)

Navigate to the `mcp-cloudrun-rust` directory and run the server:

```bash
cd mcp-cloudrun-rust
make run
```
The server will start on `http://localhost:8080`.

### 2. Start the Agent (Python)

Navigate to the `basic_agent` directory, install dependencies, and run the agent:

```bash
cd basic_agent
pip install -r requirements.txt
python agent.py
```
*(Note: You will need to set up your environment variables like `GOOGLE_API_KEY` or `GOOGLE_APPLICATION_CREDENTIALS`.)*

## Architecture

The system uses the **Model Context Protocol (MCP)** to allow the ADK agent to dynamically discover and use tools provided by the Rust server.

- **Agent**: Python (google-adk)
- **MCP Server**: Rust (rmcp)
- **Model**: Gemini (e.g., gemini-2.5-flash)
