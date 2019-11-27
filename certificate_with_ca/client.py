import requests


response = requests.get(
    'https://localhost:5000',
    cert=('certs/client/certificate.crt', 'certs/client/private.key'),
    verify='certs/ca/certificate.crt',
)

print(response.text)
