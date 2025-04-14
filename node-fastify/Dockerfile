FROM node:18

# Set working directory inside the container
WORKDIR /app

# Install PostgreSQL client tools (including pg_isready)
RUN apt-get update && apt-get install -y postgresql-client

# Copy shared wait script from root
COPY scripts/wait-for-it.sh ./wait-for-it.sh
RUN chmod +x ./wait-for-it.sh

# Copy package files from the node-fastify directory and install dependencies
COPY node-fastify/package*.json ./
COPY node-fastify/tsconfig.json ./
RUN npm install

# Install ts-node-dev globally
RUN npm install -g ts-node-dev

# Copy the rest of the source code from the node-fastify directory
COPY node-fastify/ ./

# Expose the port
EXPOSE 3001

# Use wait-for-it.sh to wait for Postgres, then start the dev server
CMD ["./wait-for-it.sh", "postgres", "ts-node-dev", "src/index.ts"]
