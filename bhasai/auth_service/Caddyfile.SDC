{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    
    
    handle_path /auth_service* {
        reverse_proxy auth_service:3000
    }
}