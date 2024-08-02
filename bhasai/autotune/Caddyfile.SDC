{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /autotune* {
        reverse_proxy autotune:8000
    }
}