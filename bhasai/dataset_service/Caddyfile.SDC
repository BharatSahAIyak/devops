{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}
  
    handle_path /dataset_service* {
        reverse_proxy dataset_service:3000
    }
}