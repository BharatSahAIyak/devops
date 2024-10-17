handle_path /pdf-generator* {
    reverse_proxy pdf_generator:3000
}