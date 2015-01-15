library network;

import 'dart:io';
import 'dart:convert';



part 'connection.dart';

List<Connection> clients=new List();
void main(){
  //TODO: use the constant in const.dart
  HttpServer.bind(InternetAddress.ANY_IP_V4,8000).then((HttpServer server){
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