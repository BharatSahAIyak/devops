{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /nodehub* {
        reverse_proxy nodehub:3000
    }
}