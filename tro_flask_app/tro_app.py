from flask import Flask

server = Flask(__name__)


@server.route('/')
def index():
    return "Congratulations, it's a web app!"


@server.route('/<b42>')
def it_be_42(b42):
    if b42 == "42":
        return "Congratulations, it's 42!"
    else:
        return "Sorry but your no 42"
