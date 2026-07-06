# App
from flask import Flask
from .database import init_db

def create_app():
    app = Flask(__name__)

    with app.app_context():
        init_db()

    from .routes import bp
    app.register_blueprint(bp)

    return app