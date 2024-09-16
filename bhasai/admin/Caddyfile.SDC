handle /admin* {
    reverse_proxy admin:3000
}
