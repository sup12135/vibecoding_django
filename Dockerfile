FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Collect static files (ensure STATIC_ROOT configured)
RUN python manage.py collectstatic --noinput || true

CMD ["gunicorn", "memojjang.wsgi:application", "--bind", "0.0.0.0:8000"]
