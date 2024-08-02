{$DOMAIN_SCHEME}://{$DOMAIN_NAME} {

    {$TLS_ENTRY}

    handle_path /yt-parser* {
        reverse_proxy yt_parser:8000
    }
}