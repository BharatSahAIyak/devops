{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /uci_apis* {
        reverse_proxy uci_apis:3000
    }
}