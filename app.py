from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
import os
from nfa_converter import regex_to_nfa, draw_nfa
from dfa_converter import regex_to_dfa, draw_dfa

app = Flask(__name__, static_folder="static")
CORS(app)

@app.route("/convert", methods=["POST"])
def convert_regex():
    data = request.get_json()
    regex = data.get("regex", "")
    automaton_type = data.get("type", "nfa")

    try:
        if automaton_type == "dfa":
            dfa = regex_to_dfa(regex)
            path = draw_dfa(dfa, "static/dfa")
            return jsonify({"image": "/static/dfa.png"})
        else:
            nfa = regex_to_nfa(regex)
            path = draw_nfa(nfa, "static/nfa")
            return jsonify({"image": "/static/nfa.png"})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/static/<path:filename>")
def serve_static(filename):
    return send_from_directory("static", filename)

# ✅ FOR RENDER DEPLOYMENT — USE 0.0.0.0 + PORT from env
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
import os
import graphviz

print("DOT PATH CHECK:", os.system("which dot"))
print("PATH:", os.environ.get("PATH"))
