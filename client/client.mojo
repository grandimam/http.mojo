from python import Python
from python.object import PythonObject

struct HTTPClient:
    var host: String
    var port: String
    var socket: PythonObject

    fn __init__(inout self, host: String, port: String) raises:
        self.host = host
        self.port = port
        let server = Python.import_module("socket")
        self.socket = server.socket(server.AF_INET, server.SOCK_STREAM)

    fn send_request(inout self, request: PythonObject) raises:
        try:
            self.socket.connect((self.host, self.port))
            let request_text = request.to_bytes()
            self.socket.sendall(request_text.encode("utf-8"))
            let response_text = self.socket.recv(1024).decode("utf-8")
        finally:
            self.socket.close()
