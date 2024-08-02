{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}
    
    handle_path /pdf-parser* {
        reverse_proxy pdf_parser:8000
    }
}