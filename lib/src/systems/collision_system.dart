part of gameworld;
class CollisionSystem extends EntityProcessingSystem{
  ComponentMapper<Position> posMap;
  ComponentMapper<Velocity> velMap;
  ComponentMapper<Collision> colMap;
  GameMap map;
  
  CollisionSystem(GameMap this.map):super(Aspect.getAspectForAllOf([Position,Velocity]));
  @override
  void initialize(){
    posMap=new ComponentMapper<Position>(Position, world);
    velMap=new ComponentMapper<Velocity>(Velocity, world);
    colMap=new ComponentMapper<Collision>(Collision, world);
  }
  
  @override
  void processEntity(Entity entity){
    Position pos=posMap.get(entity);
    Velocity vel=velMap.get(entity);
    Collision col=colMap.get(entity);
    
    //TODO check if collide with blocks
    
  }
  
  bool collide(Collision col1, Collision col2){
    return ((col1.mask & col2.category)!=0) && ((col2.mask & col1.category)!=0);
  }
}