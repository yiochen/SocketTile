part of gameworld;
class MovementSystem extends EntityProcessingSystem{
  ComponentMapper<Position> posMap;
  ComponentMapper<Velocity> velMap;
  
  MovementSystem():super(Aspect.getAspectForAllOf([Position,Velocity]));
  
  void initialize(){
    posMap=new ComponentMapper<Position>(Position,world);
    velMap=new ComponentMapper<Velocity>(Velocity,world);
  }
  
  void processEntity(Entity entity){
    Position pos=posMap.get(entity);
    Velocity vel=velMap.get(entity);
    pos.x+=vel.x;
    pos.y+=vel.y;
  }
  
}