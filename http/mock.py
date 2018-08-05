import http.server
import socketserver
import urllib.parse

class MyHandler(http.server.BaseHTTPRequestHandler):

    def do_GET(self):
        url = urllib.parse.urlparse(self.path)
        qs = urllib.parse.parse_qs(url.query)

        if url.path == '/login':
            self.handle_login(qs)
        else:
            self.send_response(404)
            self.end_headers()

    def handle_login(self, qs):
        print(qs)
        self.send_response(200)
        self.send_header('Content-Type', 'text/html')
        self.end_headers()
        self.wfile.write('Hey'.encode())


httpd = socketserver.TCPServer(('', 8080), MyHandler)

httpd.serve_forever()

