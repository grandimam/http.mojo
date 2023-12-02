import constant as const
from python import Python

fn client() raises:
    let socket = Python.import_module("socket")
    let client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.bind((const.HOST, const.PORT))
    client.sendall("Hello, world")
    while True:
        var data = client.recv(1024)
        print(data)