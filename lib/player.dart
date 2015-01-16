library player;
import 'dart:html';
import 'dart:convert';
import 'package:play_phaser/phaser.dart';

part 'src/states/cPlay.dart';

WebSocket ws;
Game game;

class Player{
  
  Player(String server){
    ws=new WebSocket(server);
       ws..onOpen.listen(
           (Event e){
             Map greeting={'from':'controller','message':'new'};
             ws.send(JSON.encode(greeting));
           }
       )
       ..onClose.listen((Event e){
         print('connection lost');
       });
       
      game=new Game(800,450,AUTO,'controller');
      game.state.add('play', new c_PlayState());
      game.state.start('play');    
  }
}