FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy only package files first (layer caching)
COPY package*.json ./

# Install all dependencies (including devDependencies)
RUN npm install

# Copy application source code
COPY . .

# =========================
# Stage 2: Production Stage
# =========================
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy only required files from builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/index.js ./index.js
COPY --from=builder /app/controller ./controller
COPY --from=builder /app/model ./model
COPY --from=builder /app/route ./route

# If you have config folder, add it
# COPY --from=builder /app/config ./config

# Expose backend port
EXPOSE 4000

# Start application
CMD ["node", "index.js"]
