{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /deployer* {
        reverse_proxy deployer:3000
    }
}