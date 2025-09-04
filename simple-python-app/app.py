from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return """
    <html>
      <head>
        <title>Hello Page</title>
        <style>
          body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 50px;
          }
        </style>
      </head>
      <body>
        <h1>Hello, world!!!! Akash!!!</h1>
      </body>
    </html>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

