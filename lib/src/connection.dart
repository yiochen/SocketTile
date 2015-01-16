part of server;

class Connection{
   WebSocket _socket;
  Connection(WebSocket socket){
    _socket=socket;
    socket.listen(handleMessage,onDone:handleDisconnect);
  }
  
  WebSocket get socket=>_socket;
  
  handleMessage(String s){
    print('client sent $s');
  }
  handleDisconnect(){
    print('Client disconnect!');
  }
}