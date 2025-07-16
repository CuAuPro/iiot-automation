FROM phusion/baseimage:jammy-1.0.1

RUN apt-add-repository -y ppa:mosquitto-dev/mosquitto-ppa && \
    apt-get update && apt-get install -y \
      certbot \
      mosquitto \
      mosquitto-clients

# Entry point with run script from /etc/service
RUN mkdir -p /etc/service/mosquitto
COPY mosquitto.sh /etc/service/mosquitto/run
RUN chmod +x /etc/service/mosquitto/run
