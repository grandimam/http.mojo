from python import Python
from python.object import PythonObject

struct HTTPServer:
    var host: String
    var port: String

    fn __init__(inout self, host: String, port: String):
        self.host = host
        self.port = port
    
    fn start(inout self) raises:
        let socket = Python.import_module("socket")
        let server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server.bind((self.host, self.port))
        server.listen()
        print("Listening on {self.host}:{self.port}")
        while True:
            let conn = server.accept()[0]
            self.handle_client(conn)
    
    fn handle_client(inout self, client_socket: PythonObject) raises:
        let data = client_socket.recv(1024)
        if not data:
            return
        else:
            let request_text = data.decode("utf-8")
            let response_text = response.to_bytes()
            client_socket.sendall(response_text.encode("utf-8"))