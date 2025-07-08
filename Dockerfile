FROM nikolaik/python-nodejs:python3.9-nodejs18

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/

RUN pip3 install --no-cache-dir --upgrade pip setuptools wheel \
    && pip3 install --no-cache-dir --requirement requirements.txt

RUN chmod +x toxic

CMD ["bash", "toxic"]
