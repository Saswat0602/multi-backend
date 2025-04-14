FROM golang:1.20

# Set the working directory inside the container
WORKDIR /app

# Install PostgreSQL client tools (including pg_isready)
RUN apt-get update && apt-get install -y postgresql-client

# Copy the wait-for-it script
COPY scripts/wait-for-it.sh ./wait-for-it.sh
RUN chmod +x ./wait-for-it.sh

# Install dependencies
COPY golang-api/go.mod golang-api/go.sum ./
RUN go mod download

# Copy all your application code
COPY golang-api/ ./

# Expose your API port
EXPOSE 3002

# Use the wait script to wait for Postgres, then start your Go app
CMD ["./wait-for-it.sh", "postgres:5432", "-t", "60", "sh", "-c", "./main"] 