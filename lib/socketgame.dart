library game;

import 'dart:html';
import 'dart:convert';
import 'package:play_phaser/phaser.dart';
import 'package:SocketTile/common.dart';
import 'package:SocketTile/world.dart';

part 'src/states/play.dart';
part 'src/states/preload.dart';


Game game;
WebSocket ws;
String TAG='game';


class SocketGame{
  SocketGame(String server){
    initWebSocket(server);
    initCanvas();
  }
  
  void initCanvas(){
    //game=new Game(window.screen.available.width,window.screen.available.height,AUTO,'game');
    game=new Game(WIDTH,HIGHT,AUTO,'game');
    //game.scale.aspectRatio=2.0;
    game.state.add('preload', new PreloadState());
    game.state.add('play', new PlayState());
    game.state.start('preload');
    
  }
  void initWebSocket(String server){
    ws=new WebSocket(server);
    ws..onOpen.listen(
         (Event e){
           print('connected to server');
           
           ws.send(newConnM(TAG));
         }
     )
     ..onMessage.listen(
         (MessageEvent e){
           print('receive the message ${e.data}');
         }
     )
     ..onClose.listen(
         (Event e){
           print('connection to server lost'); 
         }
     );
  }
}