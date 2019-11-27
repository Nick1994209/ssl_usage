import requests


try:
    requests.get('https://localhost:5000')
except requests.exceptions.SSLError as e:
    # certificate verify failed: self signed certificate
    print(e)


response = requests.get(
    'https://localhost:5000',
    verify='certs/self_signed_certificate.crt',  # or False
)
print(response.text)
