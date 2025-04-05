FROM python:3.10-slim

# Install system packages including Graphviz
RUN apt-get update && apt-get install -y graphviz

# Install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy your app code
COPY . .

CMD ["python", "app.py"]
