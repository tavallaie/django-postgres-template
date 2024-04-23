# Django-Postgres Template

This template provides a ready-to-use setup for running a Django application with PostgreSQL using Docker. It includes separate Docker Compose configurations for development and production environments.

## Environment Setup

Before you begin, make sure Docker and Docker Compose are installed on your system. You will also need to create a `.env` file at the root of the project with necessary configurations:

```plaintext
POSTGRES_DB=postgres
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_password
```

Replace your_password with a secure password of your choice.


# Running the Project
## Prerequisites

Before running the project, ensure that you have set up your Django `settings.py` to use the PostgreSQL database. Here's an example configuration:

```python
# settings.py configuration for PostgreSQL

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.getenv('DB_NAME', 'postgres'),
        'USER': os.getenv('DB_USER', 'postgres'),
        'PASSWORD': os.getenv('DB_PASSWORD', 'your_password'),
        'HOST': 'db',  # This must match the service name defined in docker-compose
        'PORT': '5432',
    }
}
```
## Development
For the development environment, which includes live reloading:

``` bash
docker-compose -f docker-compose.dev.yaml up --build
``` 
This command builds the Docker image if necessary and starts the services defined in docker-compose.dev.yaml.

## Production
For the production environment, optimized for performance:
``` bash
docker-compose -f docker-compose.prod.yaml up --build
``` 
This command builds the Docker image if necessary and starts the services defined in docker-compose.prod.yaml.

# Customization
You can customize the Dockerfiles and docker-compose files as needed to suit your project requirements.

# Contributing
Contributions to this project are welcome! Please fork the repository, make your changes, and submit a pull request.
