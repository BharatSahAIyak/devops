{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /transport_sockety* {
        reverse_proxy transport_socket:3000
    }
}