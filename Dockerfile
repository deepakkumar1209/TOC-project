# Use official Python image
FROM python:3.10-slim

# Install Graphviz system dependencies
RUN apt-get update && apt-get install -y graphviz

# Set work directory
WORKDIR /app

# Copy all files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port your app runs on
EXPOSE 10000

# Run the app
CMD ["python", "app.py"]
