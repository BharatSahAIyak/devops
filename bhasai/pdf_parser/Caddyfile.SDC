{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}
    
    handle_path /pdf_parser* {
        reverse_proxy pdf_parser:3000
    }
}