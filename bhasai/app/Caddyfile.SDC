handle /app* {
    reverse_proxy app:3000
}
