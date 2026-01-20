FROM node:18-alpine AS builder

WORKDIR /app

# Copy dependency files first (cache friendly)
COPY package*.json ./

RUN npm install

# Copy rest of the source
COPY . .

# Build frontend
RUN npm run build


# =========================
# Stage 2: Production (Nginx)
# =========================
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy build output from builder
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose nginx port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
