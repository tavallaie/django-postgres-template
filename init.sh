#!/bin/bash

# Function to create and activate a virtual environment
function create_and_use_virtualenv {
    echo "Checking for a virtual environment..."
    if [ ! -d "venv" ]; then
        echo "No virtual environment found. Creating one..."
        python3 -m venv venv
        if [ $? -ne 0 ]; then
            echo "Failed to create a virtual environment."
            exit 1
        fi
    else
        echo "Virtual environment already exists."
    fi

    echo "Activating the virtual environment..."
    source venv/bin/activate
}

# Ensure the script is run with a Python environment ready
create_and_use_virtualenv

# Load environment variables from .env file
if [ -f ".env" ]; then
    export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
else
    echo ".env file not found, please create one with DJANGO_VERSION specified."
    exit 1
fi

# Install Django
function install_django {
    echo "Installing Django ${DJANGO_VERSION} within the virtual environment..."
    pip install Django==$DJANGO_VERSION
    # Also install psycopg2-binary for PostgreSQL support
    pip install psycopg2-binary
    if [ $? -ne 0 ]; then
        echo "Failed to install Django or psycopg2-binary."
        exit 1
    fi
    echo "Django and psycopg2-binary have been installed successfully."
}

# Function to check if Django is installed and install if not
function check_and_install_django {
    django-admin --version >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        install_django
    else
        echo "Django is already installed."
    fi
}

# Check if Django is installed, install if not
check_and_install_django

# Get project name from user
echo "Enter your Django project name:"
read PROJECT_NAME

# Ensure the project name is not empty
if [ -z "$PROJECT_NAME" ]; then
    echo "Project name cannot be empty"
    exit 1
fi

# Create Django project
django-admin startproject $PROJECT_NAME .

# Ensure the project was created successfully
if [ ! -d "$PROJECT_NAME" ]; then
    echo "Failed to create the Django project. Please check your setup and permissions."
    exit 1
fi

# Move into the project directory
cd $PROJECT_NAME

# Create requirements.txt with the exact versions of all installed packages
echo "Creating requirements.txt using pip freeze..."
pip freeze > requirements.txt

echo "Project $PROJECT_NAME initialized successfully."
echo "Requirements.txt created."
