# Creating a Self-Signed Certificate

mkdir certs

# 1 создадим приватный ключ
openssl genrsa -out certs/private.key 2048  # по дефолту RSA можно еще и DSA

# 2 создадим самоподписаный сертификат
openssl req -x509 -new -days 365 \
 -subj "/C=RU/ST=Russia/L=Moscow/O=QIWI/CN=localhost" \
 -key certs/private.key -out certs/self_signed_certificate.crt

# прочитать полученный сертификат
# $ openssl x509 -in self_signed_certificate.crt -text -fingerprint
