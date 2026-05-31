FROM nousresearch/hermes-agent:latest

RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*

COPY start.sh /opt/hermes/railway-start.sh
RUN chmod +x /opt/hermes/railway-start.sh

ENTRYPOINT ["/usr/bin/tini", "-g", "--", "/opt/hermes/docker/entrypoint.sh"]
CMD ["/opt/hermes/railway-start.sh"]
