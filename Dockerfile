# Use official Python image as base
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Collect static files (optional)
RUN python manage.py collectstatic --noinput

# Expose the port the app runs on
EXPOSE 8000

# Run the application using gunicorn
CMD ["gunicorn", "IMDB-Clone-DRF.wsgi:application", "--bind", "0.0.0.0:8000"]
