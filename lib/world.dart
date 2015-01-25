library gameworld;

import 'package:dartemis/dartemis.dart';
import 'package:play_phaser/phaser.dart' as phaser;
import 'dart:math';
import 'package:SocketTile/common.dart';
import 'package:SocketTile/socketgame.dart';

part 'src/objects/map.dart';

part 'src/util/entitymaker.dart';

part 'src/components/position.dart';
part 'src/components/velocity.dart';
part 'src/components/display.dart';
part 'src/components/animation.dart';
part 'src/components/block.dart';
part 'src/components/hero.dart';
part 'src/components/collision.dart';
part 'src/components/shadow.dart';

part 'src/systems/movement_system.dart';
part 'src/systems/velocity_system.dart';
part 'src/systems/display_system.dart';
part 'src/systems/hero_anim_system.dart';
part 'src/systems/collision_system.dart';
part 'src/systems/shadow_system.dart';

class GameWorld extends World{
  GameMap map;
  var socketgame;
  
  GameWorld(Map tilemap,this.socketgame){
    map=new GameMap.fromJSON(tilemap);
  }
  
  
  void init(){
    //velocity
    this.addSystem(new VelocitySystem(socketgame.cursor));
    //position
    this.addSystem(new MovementSystem());
    //collision
    this.addSystem(new CollisionSystem(map));
    //shadow
    this.addSystem(new ShadowSystem());
    
    this.addSystem(new DisplaySystem());
    this.addSystem(new HeroAnimSystem());
    this.initialize();
  }
  
  
  test(){
    print('width ${map.width} height: ${map.height}  threshold ${map.threshold}');
       print('tile size ${tilesize}  mapwidth : ${map.mapWidth}');
       print('get 1,1: ${map.tilecode(1, 1)}  get left ${map.leftPX(1)} right ${map.rightPX(1)} top ${map.topPY(1)} bottom ${map.bottomPY(1)}');
       print('get topLeft ${map.topLeftPX(2, 1).toString()}');
       print('get anchor point of tile 15 ${map.anchorPx(map.index2x(15),map.index2y(15))}');
       print('snap 60 ${map.snapPX(60)}, snappable? ${map.snappable(60)}');
       print('snap 43 ${map.snapPX(43)}, snappable? ${map.snappable(43)}');
       print('index of first row, third colume ${map.coor2index(2, 0)}');
       print('index of the point that contains (60,20) ${map.index(60, 20)}');
  }
  
}