part of gameworld;
class BombSystem extends EntityProcessingSystem{
  ComponentMapper<Bomb> bombMap;
  ComponentMapper<Timer> timeMap;
  ComponentMapper<Display> disMap;
  ComponentMapper<Child> childMap;
  GameMap map;
  
  
  BombSystem(GameMap this.map):super(Aspect.getAspectForAllOf([Bomb,Timer,Display,Child]));
  
  @override
  void initialize(){
    bombMap=new ComponentMapper<Bomb>(Bomb,world);
    timeMap=new ComponentMapper<Timer>(Timer,world);
    disMap=new ComponentMapper<Display>(Display,world);
    childMap=new ComponentMapper<Child>(Child,world);
  }
  @override 
  void processEntity(Entity entity){
    Bomb bomb=bombMap.get(entity);
    Timer timer=timeMap.get(entity);
    Display dis=disMap.get(entity);
    Child child=childMap.get(entity);
    if (timer.finished){
      entity.deleteFromWorld();
      return;
    }
    if (timer.checked==false){
      timer.checked=true;
      phaser.Sprite explosion=child.sprite;
      explosion.animations.add('explode');
      dis.sprite.addChildAt(explosion,dis.sprite.children.length);
      
      num x=0;
      num y=0;
      switch (bomb.dir){
        case UP:
          x=0;
          y=-(timer.loop)*tilesize;
          break;
        case DOWN:
          x=0;
          y=(timer.loop)*tilesize;
          break;
        case LEFT:
          x=-(timer.loop)*tilesize;
          y=0;
          break;
        case RIGHT:
          x=(timer.loop)*tilesize;
          break;
      }
      explosion.x=x;
      explosion.y=y;
      explosion.scale.x=55/250;
      explosion.scale.y=55/250;
      explosion.animations.play('explode',18,true);
      var i=timer.loop-bomb.length;
      if (i>=0){
        dis.sprite.removeChildAt(0);
      }
      
    }
    
  }
}