//entry point for controller.html
//in charge of rendering the game pad
import 'dart:html';
import 'package:SocketTile/common.dart';
import 'package:SocketTile/player.dart';

Player controller;
WebSocket ws;

void main(){
  String server='ws://localhost:$PORT';
  controller=new Player(server);
}
