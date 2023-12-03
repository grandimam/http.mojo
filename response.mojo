struct HTTPResponse:

    var body: String
    var status_message: String
    var status_code: String
    var method: String
    var headers: String

    fn __init__(inout self, status_code: String, status_message: String, headers: String, body: String):
        self.status_code = status_code
        self.status_message = status_message
        self.headers = headers
        self.body = body