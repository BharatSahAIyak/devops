{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /telemetry* {
        reverse_proxy telemetry:3000
    }
}