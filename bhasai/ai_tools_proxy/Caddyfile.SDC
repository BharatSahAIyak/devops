{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}
    
    handle_path /ai-tools-proxy* {
        reverse_proxy ai_tools_proxy:3000
    }
}