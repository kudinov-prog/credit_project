FROM python:3.8.5
WORKDIR /code
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . .
CMD gunicorn credit_project.wsgi:application --bind 0.0.0.0:8000