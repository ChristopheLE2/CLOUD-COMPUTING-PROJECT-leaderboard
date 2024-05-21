# Utiliser une image de base officielle de Python
FROM python:3.10.1-alpine

# Définir le répertoire de travail
WORKDIR /code

ENV PYTHONDONTWRITEBYCODE 1
ENV PYTHONBUFFERED 1

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install --upgrade pip

# Copier les fichiers requirements.txt et installer les dépendances
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copier le reste du code de l'application
COPY . /code/

EXPOSE 8000

CMD ["gunicorn","--bind","0.0.0.0:8000","--workers","3","leaderboard.wsgi:application"]