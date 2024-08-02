{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}

    handle_path /nodehub* {
        reverse_proxy nodehub:3000
    }
}