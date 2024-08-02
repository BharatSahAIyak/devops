{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}
   
    handle_path /deployer* {
        reverse_proxy deployer:3000
    }
}