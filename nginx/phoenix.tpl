server {
    listen      %ip%:%web_port%;
    server_name %domain_idn% %alias_idn%;
    ssl         on;
    ssl_certificate      %ssl_pem%;
    ssl_certificate_key  %ssl_key%;
    error_log  /var/log/%web_system%/domains/%domain%.error.log error;

    location / {
        proxy_pass      http://localhost:4002;
        location ~* ^.+\.(%proxy_extentions%)$ {
            root           /var/app/%domain%/lib/simpapp-0.0.1/priv/static/;
            access_log     /var/log/%web_system%/domains/%domain%.log combined;
            access_log     /var/log/%web_system%/domains/%domain%.bytes bytes;
            expires        max;
            try_files      $uri @fallback;
        }
    }

    location /error/ {
        alias   %home%/%user%/web/%domain%/document_errors/;
    }

    location @fallback {
        proxy_pass      http://localhost:4002;
    }

    location ~ /\.ht    {return 404;}
    location ~ /\.svn/  {return 404;}
    location ~ /\.git/  {return 404;}
    location ~ /\.hg/   {return 404;}
    location ~ /\.bzr/  {return 404;}
    
    include     /etc/nginx/conf.d/phpmyadmin.inc*;
    include     /etc/nginx/conf.d/phppgadmin.inc*;
    include     /etc/nginx/conf.d/webmail.inc*;

    include %home%/%user%/conf/web/nginx.%domain%.conf*;
}
