handle_path /broadcast-service* {
    reverse_proxy broadcast_service:8000
}