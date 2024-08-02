{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}
   
    handle_path /inboundjs* {
        reverse_proxy inboundjs:3000
    }
}