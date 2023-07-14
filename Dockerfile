FROM nginx:1.23.3

RUN     apt-get update \
     && apt-get install -y --no-install-recommends \
        wget vim iputils-ping \
	 && rm -rf /var/lib/apt/lists \
	 && rm -rf /var/cache/apt
COPY ./data/html/index.html /usr/share/nginx/html/index.html
COPY ./data/html/main.css /usr/share/nginx/html/main.css
RUN rm /etc/nginx/conf.d/default.conf
#COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./data/conf.d/site-01.conf /etc/nginx/conf.d/site-01.conf
