{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}

    handle_path /telemetry* {
        reverse_proxy telemetry:3000
    }
}