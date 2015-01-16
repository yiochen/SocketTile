library server;

import 'dart:io';
import 'dart:convert';
part 'src/connection.dart';

class Server{
  List<Connection> clients=new List();
  Server(int port){ 
      HttpServer.bind(InternetAddress.ANY_IP_V4,port).then((HttpServer server){
        print('http server listening on port 8000');
        server.serverHeader='game server (1.0)';
        server.listen((HttpRequest request){
          if (WebSocketTransformer.isUpgradeRequest(request)){
            //if upgrade request, upgrade http to websocket
            WebSocketTransformer.upgrade(request).then(handleSocket);
          }else{
            //reject regular request
            print('Regular ${request.method} request for: ${request.uri.path}');
            request.response.statusCode=HttpStatus.FORBIDDEN;
            request.response.reasonPhrase='WebSocket connections only';
            request.response.close();
          }
        });
      });
  }
  void handleSocket(WebSocket socket){
    print('client connected');
    
    Connection client=new Connection(socket);
    
    clients.add(client);
    
  }
}