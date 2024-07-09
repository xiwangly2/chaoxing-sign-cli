FROM alpine:latest

WORKDIR /app

COPY . .

# 安装依赖
RUN apk update && apk add --no-cache nodejs npm expect \
    && npm install -g pnpm \
    && pnpm install \
    && pnpm build

EXPOSE 5000 80

# 运行 expect 脚本
CMD expect /app/auto_signin.exp
