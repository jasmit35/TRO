FROM python:3.8

WORKDIR /home/container/tro_flask_app
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
COPY *.py .




