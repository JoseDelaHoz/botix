
import socket
import sys

s = socket.socket()
host = "127.0.0.1"
port = int(sys.argv[1])

s.connect((host, port))
print 'Connected to', host
#z = raw_input("Enter something for the server: ")
z = sys.argv[2]
print z 
s.send(z)
print '[Waiting for response...]'
#print [s.recv(1024)]