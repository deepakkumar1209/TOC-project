FROM python:3.11-slim

# Install Graphviz and dependencies
RUN apt-get update && apt-get install -y graphviz

# Set working directory
WORKDIR /app

# Copy everything to the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 10000

# Start the app
CMD ["python", "app.py"]
