server {
    listen      %ip%:%web_port%;
    server_name %domain_idn% %alias_idn%;
    
    return 301 https://$server_name$request_uri;
}
