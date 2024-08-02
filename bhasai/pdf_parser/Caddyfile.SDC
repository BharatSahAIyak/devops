{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {
    
    handle_path /pdf_parser* {
        reverse_proxy pdf_parser:3000
    }
}