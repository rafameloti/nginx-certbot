FROM nginx:1.23.3

RUN     apt-get update \
     && apt-get install -y --no-install-recommends \
        wget vim iputils-ping \
	 && rm -rf /var/lib/apt/lists \
	 && rm -rf /var/cache/apt
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf
##############################################################
#####  Copiar arquivos .conf do nginx                    #####
COPY ./data/nginx/nginx.conf /etc/nginx/nginx.conf
#COPY ./data/nginx/http.d/app1.conf /etc/nginx/http.d/app1.conf #descomentar sempre na 1ª vez que for executar
# COPY ./data/nginx/http.d/app2.conf /etc/nginx/http.d/app2.conf
##############################################################
#####  Copiar arquivos html do nginx                     #####
COPY ./data/html/index.html /usr/share/nginx/html/index.html
COPY ./data/html/main.css /usr/share/nginx/html/main.css
##############################################################
