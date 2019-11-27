import ssl

import flask

app = flask.Flask('my_app')


@app.route('/')
def index():
    return 'INDEX PAGE.......'


ssl_context = ssl.create_default_context(purpose=ssl.Purpose.CLIENT_AUTH)
ssl_context.load_cert_chain(
    certfile='certs/server/certificate.crt',
    keyfile='certs/server/private.key',
)
ssl_context.load_verify_locations(
    cafile='certs/ca/certificate.crt',
)
ssl_context.verify_mode = ssl.CERT_REQUIRED

app.run(ssl_context=ssl_context)
