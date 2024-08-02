{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}
    
    handle_path /autotune* {
        reverse_proxy autotune:8000
    }
}