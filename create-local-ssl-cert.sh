openssl req -x509 -newkey rsa:2048 -sha256 -nodes -days 365 -keyout localhost-key.pem -out localhost-cert.pem -subj "/CN=localhost" -addext "subjectAltName=DNS:localhost,IP:127.0.0.1"
