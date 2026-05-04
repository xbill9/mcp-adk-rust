# Project Instructions: MCP ADK Rust

This workspace contains a cross-language implementation of an agentic system using Google's ADK and the Model Context Protocol (MCP).

## Technical Stack

- **Agent Framework**: [Google ADK](https://github.com/google/adk) (Python)
- **MCP Framework**: [rmcp](https://github.com/modelcontextprotocol/rust-sdk) (Rust)
- **LLM**: Gemini 2.5 Flash (Recommended)

## Project Components

### 1. Rust MCP Server (`mcp-cloudrun-rust/`)
- Implements a `greeting` tool.
- Built with `rmcp` and `axum`.
- Designed for deployment on Google Cloud Run.
- **Port**: 8080

### 2. Python ADK Agent (`basic_agent/`)
- Uses `LlmAgent` from ADK.
- Connects to the MCP server via `McpToolset`.
- **Environment Variables**:
    - `MCP_SERVER_URL`: URL of the MCP server (default: `http://localhost:8080`).
    - `GENAI_MODEL`: Gemini model to use.

## Development Workflows

- **Rust Development**: Follow idiomatic Rust patterns (2024 edition). Use the `Makefile` in the `mcp-cloudrun-rust` directory for builds and tests.
- **Python Development**: Use `google-adk`.
- **Integration**: The agent relies on the MCP server being active to access its tools.
