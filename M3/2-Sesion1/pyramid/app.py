from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response
from pyramid.view import view_config

@view_config(route_name='home', renderer='templates/home.html')
def home_view(request):
    return {}

if __name__ == '__main__':
    with Configurator() as config:
        config.add_route('home', '/')
        config.scan()
        config.add_static_view(name='static', path='static')
        app = config.make_wsgi_app()
    
    server = make_server('0.0.0.0', 6543, app)
    print("Server running on http://localhost:6543")
    server.serve_forever()
