library server;

import 'dart:io';
import 'dart:convert';
import 'package:SocketTile/common.dart';

part 'src/connection.dart';

class Server{
  static String TAG="server";
  int nextId=1;
  Connection gameConnection;
  List<Connection> clients=new List();
  Server(int port){ 
      HttpServer.bind(InternetAddress.ANY_IP_V4,port).then((HttpServer server){
        print('http server listening on port 8000');
        server.serverHeader='game server (1.0)';
        server.listen((HttpRequest request){
          if (WebSocketTransformer.isUpgradeRequest(request)){
            //if upgrade request, upgrade http to websocket
            Function handler=null;
            print('receive request ${request.uri.toString()}');
            if (request.uri.toString()==controllerReq){
              handler=handleControllerSocket;
            }else if (request.uri.toString()==gameReq){
              handler=handleGameSocket;
            }
            if (handler!=null){
              WebSocketTransformer.upgrade(request).then(handler);
            }
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
  ///The first connection should be game
  void handleGameSocket(WebSocket socket){
    print('game client connected');
    gameConnection=new Connection.game(socket);
  }
  ///create and add controller client if game client exists
  ///when a controller client connects, server will assign it an id
  void handleControllerSocket(WebSocket socket){
    print('controller client connected');
    if (gameConnection==null){
      //if game client has not connected yet, reject controller client connection.
      socket.add(errorM(TAG,'no game client connected yet'));
      socket.close();
    }else{
      Connection client=new Connection.controller(gameConnection,socket,nextId);
      clients[nextId]=client;
      nextId++;
    }
  }
}