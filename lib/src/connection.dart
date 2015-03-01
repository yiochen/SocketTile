part of server;

class Connection{
   WebSocket _socket;
   ///gameConn is used only by controller connection.
   Connection gameConn;
   int id;
   Connection._(WebSocket socket){
     _socket=socket;
   }
  factory Connection.game(WebSocket socket){
    Connection conn=new Connection._(socket);
    conn.id=0;
    conn._socket.listen(conn.handleGameMessage,onDone:conn.handleDisconnect);
    return conn;
  }
  
  factory Connection.controller(Connection game,WebSocket socket,int id){
    Connection conn=new Connection._(socket);
    conn.gameConn=game;
    conn.id=id;
    conn._socket.listen(conn.handleControllerMessage,onDone:conn.handleDisconnect);
    return conn;
  }
  WebSocket get socket=>_socket;
  
  handleControllerMessage(String s){
    this.gameConn.socket.add(s);
  }
  handleGameMessage(String s){
    //usually game doesnt have any outward message,except reporting win and lose.
    handleMessage(s);
  }
  handleMessage(String s){
    print('client sent $s');
  }
  handleDisconnect(){
    print('Client disconnect!');
  }
}