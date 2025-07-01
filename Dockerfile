FROM python:3.11-slim

# Install uv package manager
RUN pip install uv

# Set working directory inside container
WORKDIR /app

# Copy dependency files first (for caching)
COPY pyproject.toml uv.lock ./

# Install dependencies using uv
RUN uv sync --system --no-cache-dir


# Copy the rest of the application code
COPY . .

# Run the FastAPI app (main.py inside app folder)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
