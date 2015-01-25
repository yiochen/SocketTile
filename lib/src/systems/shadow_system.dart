part of gameworld;
class ShadowSystem extends EntityProcessingSystem{
  ComponentMapper<Position> posMap;
  ComponentMapper<Shadow> shadowMap;
  
  ShadowSystem():super(Aspect.getAspectForAllOf([Position,Shadow]));
  @override
  void initialize(){
    posMap=new ComponentMapper<Position>(Position, world);
    shadowMap=new ComponentMapper<Shadow>(Shadow,world);
  }
  @override
  void processEntity(Entity entity){
    Position pos=posMap.get(entity);
    Shadow shadow=shadowMap.get(entity);
    shadow.sprite.x=pos.x;
    shadow.sprite.y=pos.y;
  }
}