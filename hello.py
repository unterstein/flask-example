from flask import Flask

app: Flask = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
