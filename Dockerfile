# Use official Python slim image
FROM python:3.11-slim

# Install graphviz system package
RUN apt-get update && apt-get install -y graphviz

# Set working directory
WORKDIR /app

# Copy everything to container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose your Flask port
EXPOSE 10000

# Run your app
CMD ["python", "app.py"]
