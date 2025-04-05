# Dockerfile

FROM python3.11-slim

# Install Graphviz
RUN apt-get update && apt-get install -y graphviz

# Set work directory
WORKDIR app

# Copy all files to container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port
EXPOSE 10000

# Start your Flask app
CMD [python, app.py]
