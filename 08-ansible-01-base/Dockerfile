# Используем официальный образ Debian 12 (bookworm)
FROM debian:bookworm-slim

# Обновляем пакеты и устанавливаем Python 3
RUN apt update && \
    apt upgrade -y && \
    apt install -y python3 python3-pip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Указываем рабочую директорию
WORKDIR /app