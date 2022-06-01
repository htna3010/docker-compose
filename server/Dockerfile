FROM python:3.9

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY requirements.txt .

RUN pip3 install -r requirements.txt

RUN mkdir -p /app/backend/server

WORKDIR /app/backend/server

COPY . /app/backend/server

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh", "--"]

CMD ["python", "run/manage.py", "runserver", "0.0.0.0:8080"]