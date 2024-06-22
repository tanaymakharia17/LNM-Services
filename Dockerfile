FROM python:3.8

# Set the working directory in the container
WORKDIR /app/

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip3 install -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY . /app/

RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8001

# Specify the command to run on container start
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8001"]