FROM python:3.12
WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
COPY app/ .

RUN useradd app
USER app

CMD ["python", "app.py"]
