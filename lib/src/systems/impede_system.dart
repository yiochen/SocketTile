part of gameworld;

class ImpedeSystem extends EntityProcessingSystem{
  ComponentMapper<Bomb> bombMap;
  ComponentMapper<Position> posMap;
  ComponentMapper<Display> disMap;
  GameMap map;
  ImpedeSystem(GameMap this.map):super(Aspect.getAspectForAllOf([Bomb,Position,Display]));
  
  @override
  void initialize(){
    bombMap=new ComponentMapper<Bomb>(Bomb, world);
    posMap=new ComponentMapper<Position>(Position, world);
    disMap=new ComponentMapper<Display>(Display,world);
  }
  
  @override
  void processEntity(Entity entity){
    Bomb bomb=bombMap.get(entity);
    Position pos=posMap.get(entity);
    Display dis=disMap.get(entity);
    int index=map.anchor2index(pos.x, pos.y);
    int x=map.index2x(index);
    int y=map.index2y(index);
    
    void move(int dis){
      switch(bomb.dir){
        case UP:
          y-=dis;
          break;
        case DOWN:
          y+=dis;
          break;
        case LEFT:
          x-=dis;
          break;
        case RIGHT:
          x+=dis;
          break;
      }
    }
    move(bomb.dis);
    Entity block=map.coor2Entity(x, y);
    (block.getComponentByClass(Display) as Display).sprite.tint=0x0000FF;
    //might need to replace the destroyed block with new floor block.
  }
}