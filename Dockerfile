# Stage 1: Builder
FROM node:18-alpine AS builder

WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app .

# Stage 2: Final image
FROM node:18-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

WORKDIR /app
COPY --from=builder /app .

EXPOSE 3000

CMD ["node", "index.js"]
