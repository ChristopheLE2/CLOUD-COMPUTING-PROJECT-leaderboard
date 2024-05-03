
# a modifier


FROM python:3.9
# Définir les variables d'environnement pour l'environnement de production
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Définir le répertoire de travail dans le conteneur
WORKDIR /code

# Installer les dépendances de l'application
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# Copier les fichiers de votre application dans le conteneur
COPY . /code/

# Exécuter les migrations et collecter les fichiers statiques
RUN python manage.py migrate
RUN python manage.py collectstatic --noinput

# Exposer le port sur lequel Django fonctionnera
EXPOSE 8000

# Commande pour démarrer le serveur Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
