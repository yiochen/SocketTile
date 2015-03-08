part of gameworld;
class VelocitySystem extends EntityProcessingSystem{
  
  
  ComponentMapper<Velocity> velMap;
  
  VelocitySystem() : super(Aspect.getAspectForAllOf([Velocity]));
  
  
  
  @override
  void initialize(){
    velMap=new ComponentMapper<Velocity>(Velocity, world);
  }
  
  @override
  void processEntity(Entity entity) {
   
  }
}