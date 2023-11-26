vcl 4.0;

backend default {
    .host = "wordpress";  // Nome do serviço do WordPress no Docker Compose
    .port = "8080";         // Porta do serviço do WordPress
}

sub vcl_recv {
    # Configurações para manipular as requisições
    if (req.url ~ "\.(css|js|jpg|jpeg|png|gif|gz|tgz|bz2|tbz|mp3|ogg|swf|flv|ico)$") {
        unset req.http.Cookie;
        return (hash);
    }

    if (req.url ~ "\/wp-(login|admin)") {
        return (pass);
    }
}

sub vcl_backend_response {
    # Configurações para manipular as respostas do backend
    if (beresp.http.Set-Cookie) {
        unset beresp.http.Set-Cookie;
    }

    if (beresp.ttl <= 0s || beresp.http.Cache-Control ~ "no-cache") {
        set beresp.ttl = 3600s;  // Tempo de vida do cache (aqui, 1 hora)
        return (deliver);
    }
}

sub vcl_deliver {
    # Configurações finais para a entrega da resposta
    return (deliver);
}
