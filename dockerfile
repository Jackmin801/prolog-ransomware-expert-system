FROM python:3.8-slim

COPY . /code
WORKDIR /code

# Install dependencies
#RUN apt install -y gprolog
RUN pip install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 80
CMD ["sh", "run.sh"]
