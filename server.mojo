import constant as const
from python import Python

fn server() raises:
    let socket = Python.import_module("socket")
    let server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((const.HOST, const.PORT))
    server.listen()
    let conn_addr = server.accept()
    let conn = conn_addr[0]
    let addr = conn_addr[1]
    while True:
        let data = conn.recv(1024)
        if data:
            print("Message from client: ", data)
        else:
            break
        conn.sendall(data)
    conn.close()
    server.close()