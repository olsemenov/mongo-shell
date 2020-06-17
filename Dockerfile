FROM debian:buster-slim


# Install required gnupg package
RUN apt-get -q update && apt-get -y -q upgrade \
&& apt-get -y install gnupg ca-certificates wget \
&& rm -rf /var/lib/apt/lists/* \
&& wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - \
&& echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list \
&& apt-get update 

# Install the MongoDB packages
RUN apt-get -y install mongodb-org-shell mongodb-org-tools