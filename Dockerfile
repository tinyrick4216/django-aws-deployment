FROM python:3.8.13-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Copy your app code to the container's working directory
COPY ./my_app ./

# Upgrade pip and install dependencies
RUN pip install --upgrade pip --no-cache-dir
RUN pip install -r /app/requirements.txt --no-cache-dir

# Expose the port that the app will run on
EXPOSE 8000

# Run the Gunicorn server with the correct command
CMD ["gunicorn", "main_app.wsgi:application", "--bind", "0.0.0.0:8000"]
