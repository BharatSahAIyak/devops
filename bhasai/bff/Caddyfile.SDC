{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /bff* {
        reverse_proxy bff:3000
    }
}