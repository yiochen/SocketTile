part of gameworld;
class VelocitySystem extends EntityProcessingSystem{
  
   //for debug only
  phaser.CursorKeys cursor;
  ComponentMapper<Velocity> velMap;
  
  VelocitySystem(phaser.CursorKeys this.cursor) : super(Aspect.getAspectForAllOf([Velocity]));
  
  
  
  @override
  void initialize(){
    velMap=new ComponentMapper<Velocity>(Velocity, world);
  }
  
  @override
  void processEntity(Entity entity) {
    Velocity vel=velMap.get(entity);
    if (cursor.up.isDown){
      vel.dir=d_UP;
      vel.v=vel.maxV;
      return;
    }
    if (cursor.down.isDown){
      vel.dir=d_DOWN;
      vel.v=vel.maxV;
      return;
    }
    if (cursor.left.isDown){
      vel.dir=d_LEFT;
      vel.v=vel.maxV;
      return;
    }
    if (cursor.right.isDown){
      vel.dir=d_RIGHT;
      vel.v=vel.maxV;
      return;
    }
    vel.v-=vel.maxV/5;
    if (vel.v<0){vel.v=0;}
  }
}