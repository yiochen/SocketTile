library gameworld;

import 'package:dartemis/dartemis.dart';
import 'dart:math';
part 'src/objects/map.dart';
part 'src/components/position.dart';
part 'src/components/velocity.dart';
part 'src/systems/movement_system.dart';


class GameWorld extends World{
  GameMap map;
  GameWorld(Map tilemap){
    map=new GameMap.fromJSON(tilemap);
    print('width ${map.width} height: ${map.height}  threshold ${map.threshold}');
    print('tile size ${map.tilesize}  mapwidth : ${map.mapWidth}');
    print('get 1,1: ${map.index(1, 1)}  get left ${map.leftPX(1)} right ${map.rightPX(1)} top ${map.topPY(1)} bottom ${map.bottomPY(1)}');
    print('get topLeft ${map.topLeftPX(2, 1).toString()}');
    print(map.data.join(' '));
    this.addSystem(new MovementSystem());
  }
  
  newEntity(){
    Entity entity=this.createEntity();
    entity.addComponent(new Position(0,0));
    entity.addToWorld();
  }
  
}