import ssl

import flask

app = flask.Flask('my_app')


@app.route('/')
def index():
    return 'INDEX'


ssl_context = ssl.create_default_context(purpose=ssl.Purpose.CLIENT_AUTH)
ssl_context.load_cert_chain(
    certfile='certs/self_signed_certificate.crt',
    keyfile='certs/private.key',
)

app.run(ssl_context=ssl_context)
