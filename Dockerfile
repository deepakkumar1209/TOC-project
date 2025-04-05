# Use official Python image
FROM python:3.10-slim

# Install Graphviz and other dependencies
RUN apt-get update && \
    apt-get install -y graphviz && \
    pip install --upgrade pip

# Set work directory
WORKDIR /app

# Copy your code
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose the port Render uses
EXPOSE 10000

# Start the Flask app
CMD ["python", "app.py"]
