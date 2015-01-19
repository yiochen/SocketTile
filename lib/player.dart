library player;
import 'dart:html';
import 'package:play_phaser/phaser.dart';
import 'package:SocketTile/common.dart';
import 'dart:async';
part 'src/states/cPlay.dart';
part 'src/objects/gamepad.dart';

WebSocket ws;
Game game;
String TAG='player';

class Player{
  
  Player(String server){
    ws=new WebSocket(server);
       ws..onOpen.listen(
           (Event e){
             
             ws.send(newConnM(TAG));
           }
       )
       ..onClose.listen((Event e){
         print('connection lost');
       });
       game=new Game(800,600,AUTO,'controller');
      //game=new Game(window.screen.available.width,window.screen.available.height,AUTO,'controller');
      
      game.state.add('play', new c_PlayState());
      game.state.start('play'); 
      
  }
}