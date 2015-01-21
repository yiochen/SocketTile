part of gameworld;
class DisplaySystem extends EntityProcessingSystem{
  
  ComponentMapper<Display> disMap;
  ComponentMapper<Position> posMap;
  
  DisplaySystem() : super(Aspect.getAspectForAllOf([Position,Display]));
  
  @override
  void initialize(){
    disMap=new ComponentMapper<Display>(Display,world);
    posMap=new ComponentMapper<Position>(Position,world);
  }
  
  @override
  void processEntity(Entity entity) {
    Display dis=disMap.get(entity);
    Position pos=posMap.get(entity);
    
    dis.sprite.x=pos.x;
    dis.sprite.y=pos.y;
    
    
  }
}