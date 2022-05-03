FROM python:3.9-slim-buster
ARG ENVIRONMENT

COPY install-packages.sh .
RUN ./install-packages.sh

WORKDIR /home/container/tro
COPY ./src .
# COPY ./src/local/bin/"$ENVIRONMENT"_bash_profile ../.bash_profile
RUN useradd -d /home/container -u 5000 container
RUN chown -R container.container /home/container 
USER container

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD [ "python", "-u", "./local/python/main.py" ]
