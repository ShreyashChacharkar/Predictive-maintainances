FROM python:3.11-slim-bullseye
WORKDIR /app
COPY . .

# Create and activate a virtual environment
RUN python -m venv venv
RUN /bin/bash -c "source venv/bin/activate"

# Install dependencies within the virtual environment
RUN pip install -r requirements.txt

# Rest of your Dockerfile
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
EXPOSE 5000