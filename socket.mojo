from python import Python
from python.object import PythonObject

struct MojoSock:
    var msock: PythonObject
    var mserver: PythonObject

    fn __init__(inout self) raises:
        self.msock = Python.import_module("socket")
        
    fn __enter__(inout self) raises -> PythonObject:
        self.mserver = self.msock.socket(self.msock.AF_INET, self.msock.SOCK_STREAM)
        return self.mserver
    
    fn __exit__(inout self) raises:
        _ = self.mserver.close()