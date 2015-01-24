part of gameworld;
class MovementSystem extends EntityProcessingSystem{
  ComponentMapper<Position> posMap;
  ComponentMapper<Velocity> velMap;
  
  MovementSystem():super(Aspect.getAspectForAllOf([Position,Velocity]));
  @override
  void initialize(){
    posMap=new ComponentMapper<Position>(Position,world);
    velMap=new ComponentMapper<Velocity>(Velocity,world);
  }
  @override
  void processEntity(Entity entity){
    Position pos=posMap.get(entity);
    Velocity vel=velMap.get(entity);
    
    
    switch (vel.dir){
      case UP: 
        pos.y-=vel.v;
        break;
      case DOWN:
        pos.y+=vel.v;
        break;
      case LEFT:
        pos.x-=vel.v;
        break;
      case RIGHT:
        pos.x+=vel.v;
        break;
    }
    
  }
  
}