from flask import Flask
from flask import render_template
app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    user = {'username': 'github.com/TheManuel0'}
    return render_template('index.html', user=user)
