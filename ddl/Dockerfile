FROM debian:buster-slim

COPY install-packages.sh .
RUN ./install-packages.sh

RUN useradd -m -d /home/container -u 5000 container
RUN chown -R container /home/container 
USER container
WORKDIR /home/container/tro

COPY ./src .

# CMD [ "python", "-u", "./local/python/trorpts.py", "-e", "devl" ]
# CMD [ "/bin/bash", "sleep", "1800" ]
