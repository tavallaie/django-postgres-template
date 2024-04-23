# Django-Postgres Template

This template provides a ready-to-use setup for running a Django application with PostgreSQL using Docker. It includes separate Docker Compose configurations for development and production environments.

## Environment Setup

Before you begin, make sure Docker and Docker Compose are installed on your system. You will also need to create a `.env` file at the root of the project with necessary configurations:

```plaintext
POSTGRES_DB=postgres
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_password
Replace your_password with a secure password of your choice.
```

# Running the Project
## Development
For the development environment, which includes live reloading:

``` bash
docker-compose -f docker-compose.dev.yaml up --build
This command builds the Docker image if necessary and starts the services defined in docker-compose.dev.yaml.
``` 
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