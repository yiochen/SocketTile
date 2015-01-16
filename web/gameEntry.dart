//entry point of index.html
//in charge of rendering the game scene

import 'package:SocketTile/common.dart';
import 'package:SocketTile/socketgame.dart';

void main() {
  String server='ws://localhost:$PORT';
  SocketGame game=new SocketGame(server);
}
