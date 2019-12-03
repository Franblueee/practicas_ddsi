from flask import Flask
#from flask_api import status
from proveedores.methods import proveedores

app = Flask(__name__)

#time.sleep(1)
app.register_blueprint(proveedores)

@app.route('/')
def main2():
    return "hola"



if __name__ == '__main__':
    app.run(debug=True)
