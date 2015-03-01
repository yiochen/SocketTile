library game;

import 'dart:html';
import 'dart:convert';

import 'package:play_phaser/phaser.dart';
import 'common.dart';
import 'world.dart';


part 'src/states/play.dart';
part 'src/states/preload.dart';




String TAG='game';


class SocketGame{
  Game game;
  //cursor is for Debug only.
  CursorKeys cursor;
  GameWorld scene;
  Group characters;
  Group bombs;
  Group shadow;
  Group groundMarks;
  Group background;
  
  WebSocket ws;
  
  SocketGame(String server){
    initWebSocket(server);
    initCanvas();
    cursor=game.input.keyboard.createCursorKeys();
  }
  
  void initCanvas(){
    game=new Game(window.screen.available.width,window.screen.available.height,AUTO,'game');
    //game=new Game(WIDTH,HIGHT,AUTO,'game');
    //game.scale.aspectRatio=2.0;
    game.state.add('preload', new PreloadState(this));
    game.state.add('play', new PlayState(this));
    game.state.start('preload');
    
  }
  void initWebSocket(String server){
    ws=new WebSocket(server);
    ws..onOpen.listen(
         (Event e){
           print('connected to server');
           
           ws.send(newConnM(TAG,0));
         }
     )
     ..onMessage.listen(
         (MessageEvent e){
           State current=game.state.getCurrentState();
           if (current is MessegeHandler){
             //forward the message to the state.
             (current as MessegeHandler).handle(e.data);
           }else{
             print('receive the message ${e.data}');
           }
         }
     )
     ..onClose.listen(
         (Event e){
           print('connection to server lost'); 
         }
     );
  }
}