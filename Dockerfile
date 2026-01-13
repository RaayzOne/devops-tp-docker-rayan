FROM nginx:alpine

LABEL maintainer="TP DevOps"
LABEL description="Application DevOps containerisée avec Nginx"

# Copier la configuration Nginx
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copier les fichiers de l'application
COPY src/ /usr/share/nginx/html/

EXPOSE 80

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
