{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}

    handle_path /document_service* {
        reverse_proxy document_service:3000
    }
}