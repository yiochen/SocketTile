part of gameworld;
///calculate the damage of each of the tile
class BombDamageSystem extends EntityProcessingSystem{
  ComponentMapper<Bomb> bombMap;
  ComponentMapper<Position> posMap;
  List dmgMap;
  
  BombDamageSystem(List this.dmgMap):super(Aspect.getAspectForAllOf([Bomb,Position]));
  @override
  void initialize(){
    
  }
  @override
  void processEntity(Entity entity){
    // recalculate the damage every frame
  }
}