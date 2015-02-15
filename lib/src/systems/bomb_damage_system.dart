part of gameworld;
///calculate the damage of each of the tile
class BombDamageSystem extends EntityProcessingSystem{
  ComponentMapper<Bomb> bombMap;
  ComponentMapper<Position> posMap;
  List dmgMap;
  GameMap map;
  
  BombDamageSystem(this.map,this.dmgMap):super(Aspect.getAspectForAllOf([Bomb,Position]));
  @override
  void initialize(){
    
    bombMap=new ComponentMapper<Bomb>(Bomb,world);
    posMap=new ComponentMapper<Position>(Position,world);
  }
  @override
  void processEntity(Entity entity){
    
    Bomb bomb=bombMap.get(entity);
    Position pos=posMap.get(entity);
    int index=map.anchor2index(pos.x, pos.y);
    int x=map.index2x(index);
    int y=map.index2y(index);
    
    void move(int dis){
      switch(bomb.dir){
        case d_UP:
          y-=dis;
          break;
        case d_DOWN:
          y+=dis;
          break;
        case d_LEFT:
          x-=dis;
          break;
        case d_RIGHT:
          x+=dis;
          break;
      }
    }
    
    move(bomb.dis);
    map.entities.forEach((entity){
      //(entity.getComponentByClass(Display)as Display).sprite.tint=0xFFFFFF;
    });
    for (int i=bomb.dis;i>bomb.dis-bomb.length && i>0;i--){
      if (map.inRange(x, y)){
        dmgMap[map.coor2index(x, y)]-=bomb.dmg;
        //(map.entities[map.coor2index(x, y)].getComponentByClass(Display) as Display).sprite.tint=0xFF0000;
        move(-1);
      }else{
        break;
      }
    }
    
  }
  
}