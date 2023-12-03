struct HTTPRequest:

    var body: String
    var path: String
    var method: String
    var headers: String

    fn __init__(inout self, method: String, path: String, headers: String, body: String):
        self.body = body
        self.path = path
        self.method = method
        self.headers = headers