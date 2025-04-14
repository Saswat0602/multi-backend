# Use Python base image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Install PostgreSQL client tools (including pg_isready)
RUN apt-get update && apt-get install -y postgresql-client

# Copy the wait-for-it script from the root directory (same level as Dockerfile)
COPY scripts/wait-for-it.sh ./wait-for-it.sh
RUN chmod +x ./wait-for-it.sh

# Copy the requirements.txt from the fastapi folder
COPY fastapi/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire fastapi folder contents to /app
COPY fastapi/ .

# Expose the port that FastAPI will run on
EXPOSE 3003

# Run the wait-for-it script, wait for Postgres to be ready, then start Uvicorn
CMD ["./wait-for-it.sh", "postgres:5432", "-t", "60", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "3003"]  
