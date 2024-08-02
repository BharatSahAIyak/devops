{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}

    handle_path /bff* {
        reverse_proxy bff:3000
    }
}