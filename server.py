from bottle import route, run, template
import os
from bitcoinrpc.authproxy import AuthServiceProxy

rpc_connection = AuthServiceProxy("http://%s:%s@127.0.0.1:18332"%('bitcoinrpc', os.environ['PASS']))

@route('/')
def index():
    return open('./bitcoind.log').readlines()

@route('/getinfo')
def getinfo():
    return str(rpc_connection.getinfo())

run(host='0.0.0.0', port=os.environ['PORT'])
