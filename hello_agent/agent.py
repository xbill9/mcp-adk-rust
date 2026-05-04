import os
from dotenv import load_dotenv
from google.adk.agents import LlmAgent

# Load environment variables from .env
load_dotenv()

root_agent = LlmAgent(
    name="hello_agent",
    model=os.getenv("GENAI_MODEL", "gemini-2.5-flash"),
    instruction="You are a helpful assistant that greets people. Just say hello to what the user passes.",
)
