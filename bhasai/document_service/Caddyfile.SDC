{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /document_service* {
        reverse_proxy document_service:3000
    }
}