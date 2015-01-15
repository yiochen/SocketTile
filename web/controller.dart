library controller;
import 'dart:html';
import 'package:play_phaser/phaser.dart';
import 'dart:convert';
part 'states/controller/cPlay.dart';


Game controller;
WebSocket ws;

void main(){
  String server='ws://localhost:8000';
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
   
  controller=new Game(800,450,AUTO,'controller');
  controller.state.add('play', new c_PlayState());
  controller.state.start('play');
  
 
  
}
