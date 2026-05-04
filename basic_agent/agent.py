import os
from dotenv import load_dotenv
from google.adk.agents import LlmAgent
from google.adk.tools.mcp_tool import McpToolset
from google.adk.tools.mcp_tool.mcp_session_manager import StreamableHTTPConnectionParams

# Load environment variables from .env
load_dotenv()

# The MCP server is expected to be running at this URL.
# In a real scenario, this would be the Cloud Run URL.
MCP_SERVER_URL = os.getenv("MCP_SERVER_URL", "http://localhost:8080")

root_agent = LlmAgent(
    name="basic_mcp_agent",
    model=os.getenv("GENAI_MODEL", "gemini-2.5-flash"),
    instruction="You are a helpful assistant that uses tools from an MCP server to greet people. Use the 'greeting' tool when asked to greet someone.",
    tools=[
        McpToolset(
            connection_params=StreamableHTTPConnectionParams(
                url=MCP_SERVER_URL,
            )
        )
    ],
)
