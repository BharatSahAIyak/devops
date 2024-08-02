{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}

    handle_path /admin* {
        reverse_proxy admin:3000
    }
}