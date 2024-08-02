{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /inboundjs* {
        reverse_proxy inboundjs:3000
    }
}