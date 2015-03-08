//entry point of index.html
//in charge of rendering the game scene
import 'dart:html';
import 'package:SocketTile/common.dart';
import 'package:SocketTile/socketgame.dart';

void main() {
  querySelector('#connect').onClick.listen(connect);
}


void connect(MouseEvent event) {
  String ip=(querySelector('#ip') as InputElement).value;
  String port=(querySelector('#port')as InputElement).value;
  String server='ws://$ip:$port$gameReq';
  querySelector('#game').style.display="block";
  bool offline=(querySelector('#offline')as InputElement).checked;
  if (offline) new SocketGame();
  else new SocketGame(server);
}
