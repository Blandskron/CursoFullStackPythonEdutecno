from bottle import route, run, template

@route('/')
def home():
    return template('index')

if __name__ == "__main__":
    run(host='localhost', port=8080)
