{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /ai_tools_proxy* {
        reverse_proxy ai_tools_proxy:3000
    }
}