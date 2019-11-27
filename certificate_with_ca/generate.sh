# Creating a CA Certificate, Server and Client

set -o errexit
set -o xtrace

mkdir -p certs/ca certs/server certs/client

# 1 создадим сертификат для удостоверяющего центра
openssl genrsa -out certs/ca/private.key 2048
openssl req -new -x509 -days 1095 \
 -subj "/C=RU/ST=Russia/L=Moscow/O=CACentre/emailAddress=mail@centre.ru" \
 -key certs/ca/private.key -out certs/ca/certificate.crt

# 2 создадим сертификат для сервера
openssl genrsa -out certs/server/private.key 2048
# создали запрос на сертификат
openssl req -new \
 -subj "/C=RU/ST=Russia/L=Moscow/O=ServerCentre/emailAddress=mail@centre.ru/CN=localhost" \
 -key certs/server/private.key -out certs/server/certificate.csr
# подпишем запрос на сертификат CA цетром
openssl x509 -req -days 365 \
 -in certs/server/certificate.csr \
 -CA certs/ca/certificate.crt -CAkey certs/ca/private.key \
 -set_serial 0x`openssl rand 16 -hex` \
 -out certs/server/certificate.crt

# 3 создадим сертификат для клиента
openssl genrsa -out certs/client/private.key 2048
# создали запрос на сертификат
openssl req -new \
 -subj "/C=RU/ST=Russia/L=Moscow/O=ClientOrg/emailAddress=mail@client.ru" \
 -key certs/client/private.key -out certs/client/certificate.csr
# подпишем запрос на сертификат CA цетром
openssl x509 -req -days 365 \
 -in certs/client/certificate.csr \
 -CA certs/ca/certificate.crt -CAkey certs/ca/private.key \
 -set_serial 0x`openssl rand 16 -hex` \
 -out certs/client/certificate.crt
