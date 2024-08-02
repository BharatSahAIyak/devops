{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}

    handle_path /uci-apis* {
        reverse_proxy uci_apis:3000
    }
}