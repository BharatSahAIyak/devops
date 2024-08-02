{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /dataset_service* {
        reverse_proxy dataset_service:3000
    }
}