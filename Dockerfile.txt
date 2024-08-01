# Використовуємо базовий образ Python
FROM python:3.8-slim

# Встановлюємо робочу директорію всередині контейнера
WORKDIR /app

# Копіюємо файли застосунку в контейнер
COPY . /app

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Відкриваємо порт 80 для зв'язку
EXPOSE 80

# Команда для запуску застосунку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
