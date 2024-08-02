{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}

    handle_path /user-management-service* {
        reverse_proxy user_management_service:3000
    }
}