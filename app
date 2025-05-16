from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

RUNPOD_GPU_URL = "http://<あなたのRunPodの公開URL>:5000/inference"

@app.route("/chat", methods=["POST"])
def chat():
    prompt = request.json.get("prompt", "")
    res = requests.post(RUNPOD_GPU_URL, json={"prompt": prompt})
    return jsonify(res.json())

if __name__ == "__main__":
    app.run()
