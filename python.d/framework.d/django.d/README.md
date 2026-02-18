# Django

## Kickstart

```bash
# Setup environment
uv python list
# Adapt the follwing python version to your prefered one
uv init --python 3.13
uv venv

# Install django
uv add django
uv add --group dev django-debug-toolbar
uv add --group prod gunicorn

# Verify installation
uv run python
## Should print something like 5.2.6
print(django.get_version())
exit()

# Start a project
uv run django-admin startproject bazzline .
# Just to check that basically all is working
# Open the url listed after `Starting development server at`
#    with a Webbrowser
uv run manage.py runserver
#   migrate database
uv run manage.py migrate

# Setup git
git init
cat > .gitignore <<DELIM
# environment
.venv/
.env

# python
__pycache__/
*.pyc

# django
*.log
db.sqlite3
db.sqlite3-journal
media/
static_collected/
**/settings.py

# ids
.vscode/
.idea/

# well, for mac users
.DS_Store
DELIM

# setup docker
cat > django.Docker <<DELIM
# Maybe adapt to a later one
# ref: https://hub.docker.com/_/python
FROM python:3.13-alpine

# Set environment variables
# Prevent Python from writing pyc files to disk
ARG PYTHONDONTWRITEBYTECODE=1
# Prevent Python from buffering stdout and stderr
ARG PYTHONUNBUFFERED=1

# Install uv
RUN pip install uv

# Create non-root user
RUN addgroup --system app && \
  adduser --system app && \
  mkdir /app

WORKDIR /app

# Copy uv project files first (for better caching)
COPY pyproject.toml uv.lock ./

# Install dependencies using uv's project management
RUN uv sync --no-cache-dir --frozen --no-dev

COPY . /app/

EXPOSE 8000

# Command for production
CMD ["uv", "run", "gunicorn", "--bind", "0.0.0.0:8000", "bazzline.wsgi:application"]
DELIM

cat > compose.yml <<DELIM
services:
  django:
    build:
      context: .
      dockerfile: django.Docker
    command: uv run python manage.py runserver 0.0.0.0:8000
    environment:
      DEBUG: ${DEBUG}
      DJANGO_ALLOWED_HOSTS: ${DJANGO_ALLOWED_HOSTS}
      DJANGO_LOGLEVEL: ${DJANGO_LOGLEVEL}
      DJANGO_SECRET_KEY: ${DJANGO_SECRET_KEY}
      # This is the section where you can add
      #   database related configuration too
    env_file:
      - .env
    volumes:
      - .:/app
    ports:
      - "8000:8000"
DELIM

cat > .env.dist <<DELIM
DEBUG=True
DJANGO_ALLOWED_HOSTS="localhost"
DJANGO_LOGLEVEL="info"
DJANGO_SECRET_KEY=
DELIM

cp .env.dist .env
# Adapt env, especially add an at least 64 character wide secret
vim .env

cat >> bazzline/settings.py <<DELIM
# Add this line on top
from os import environ

# Comment out default lines and replace with the following
SECRET_KEY = environ.get("DJANGO_SECRET_KEY")
DEBUG = bool(environ.get("DEBUG", default=0))
ALLOWED_HOSTS = environ.get("DJANGO_ALLOWED_HOSTS","127.0.0.1").split(",")
DELIM

docker compose up --build -d
docker compose exec -it django sh
uv run manage.py migrate
```

Continue with reading the [official tutorial](https://docs.djangoproject.com/en/5.2/intro/tutorial01/).

## Links

* [start: djangoproject.com](https://www.djangoproject.com/start/) - 20250929
* [How to optimize djanro rest apis for performance: freecodecamp.org](https://www.freecodecamp.org/news/how-to-optimize-django-rest-apis-for-performance/) - 20260218
