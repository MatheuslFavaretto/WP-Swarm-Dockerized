FROM varnish:latest

# Copiar o arquivo de configuração VCL para o local correto no contêiner
COPY config.vcl /etc/varnish/default.vcl

# Comando para iniciar o Varnish e carregar o arquivo de configuração VCL
CMD ["varnishd", "-F", "-f", "/etc/varnish/default.vcl"]
