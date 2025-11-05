from flask import Flask, jsonify
app = Flask(__name__)

@app.get('/')
def index():
    return jsonify({"message":"Hello from Python Flask"})

@app.get('/health')
def health():
    return "OK", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(__import__('os').environ.get('PORT', 8000)))
