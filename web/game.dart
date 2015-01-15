// Copyright (c) 2015, Yiou Chen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library game;

import 'dart:html';
import 'package:play_phaser/phaser.dart';


part 'const.dart';
part 'states/game/preload.dart';
part 'states/game/play.dart';
part 'client/client.dart';
Game game;

void main() {
  initCanvas();
}
void initCanvas(){
  game=new Game(WIDTH,HIGHT,AUTO,'game');
  game.scale.aspectRatio=2.0;
  game.state.add('preload', new PreloadState());
  game.state.add('play', new PlayState());
  game.state.start('preload');
  
}
