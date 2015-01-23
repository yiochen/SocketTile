part of gameworld;
class HeroAnimSystem extends EntityProcessingSystem{
  
  ComponentMapper<Animation> animMap;
  ComponentMapper<Position> posMap;
  ComponentMapper<Velocity> velMap;
  
  
  HeroAnimSystem(): super(Aspect.getAspectForAllOf([Animation,Position,Hero,Velocity]));
  
  @override
  void initialize(){
    posMap=new ComponentMapper<Position>(Position,world);
    animMap=new ComponentMapper<Animation>(Animation,world);
    velMap=new ComponentMapper<Velocity>(Velocity, world);
  }
  
  @override
  void processEntity(Entity entity){
    Animation anim=animMap.get(entity);
    Position pos=posMap.get(entity);
    Velocity vel=velMap.get(entity);
    
    anim.sprite.x=pos.x-tilesize/2;
    anim.sprite.y=pos.y;
    
    if (vel.v>0){
      anim.sprite.play('walk');
    }else{
      anim.sprite.play('stand');
    }
    if (vel.dir==LEFT){
      anim.sprite.scale.x=-1;
    }
    if (vel.dir==RIGHT){
      anim.sprite.scale.x=1;
    }
  }
}