{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /yt_parser* {
        reverse_proxy yt_parser:8000
    }
}