part of gameworld;
typedef void ColCallback(Position pos,int dir,bool b1, bool b2, bool b3, bool b4);
class CollisionSystem extends EntityProcessingSystem{
  ComponentMapper<Position> posMap;
  ComponentMapper<Velocity> velMap;
  ComponentMapper<Collision> colMap;
  GameMap map;
  
  CollisionSystem(GameMap this.map):super(Aspect.getAspectForAllOf([Position,Velocity,Collision]));
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
    bool b1,b2,b3,b4;
    //TODO check if collide with blocks
    switch (vel.dir){
      case UP:
        var y=pos.y-tilesize;
        var x1=pos.x;
        var x4=pos.x+tilesize;
        var x2=x1+map.threshold;
        var x3=x4-map.threshold;
        bool b1=_could(getEnt(x1,y),entity);
        bool b2=_could(getEnt(x2,y),entity);
        bool b3=_could(getEnt(x3,y),entity);
        bool b4=_could(getEnt(x4,y),entity);
        handleVertical(pos,b1,b2,b3,b4);
        return;
      case DOWN:
        var y=pos.y;
        var x1=pos.x;
        var x4=pos.x+tilesize;
        var x2=x1+map.threshold;
        var x3=x4-map.threshold;
        bool b1=_could(getEnt(x1,y),entity);
        bool b2=_could(getEnt(x2,y),entity);
        bool b3=_could(getEnt(x3,y),entity);
        bool b4=_could(getEnt(x4,y),entity);
        handleVertical(pos,b1,b2,b3,b4);
        return;
      case LEFT:
        var x=pos.x;
        var y1=pos.y-tilesize;
        var y4=pos.y;
        var y2=y1+map.threshold;
        var y3=y4-map.threshold;
        bool b1=_could(getEnt(x,y1),entity);
        bool b2=_could(getEnt(x,y2),entity);
        bool b3=_could(getEnt(x,y3),entity);
        bool b4=_could(getEnt(x,y4),entity);
        handleHorizontal(pos,b1,b2,b3,b4);
        return;
      case RIGHT:
        var x=pos.x+tilesize;
        var y1=pos.y-tilesize;
        var y4=pos.y;
        var y2=y1+map.threshold;
        var y3=y4-map.threshold;
        bool b1=_could(getEnt(x,y1),entity);
        bool b2=_could(getEnt(x,y2),entity);
        bool b3=_could(getEnt(x,y3),entity);
        bool b4=_could(getEnt(x,y4),entity);
        handleHorizontal(pos,b1,b2,b3,b4);
        return;
      default:
        
    }
  }
   void handleVertical(Position pos, b1,b2,b3,b4){
    if (b2||b3){
      pos.y=map.snapPX(pos.y);
      return;
    }
    if (b1||b4){
      pos.x=map.snapPX(pos.x);
    }
  }
  void handleHorizontal(Position pos,b1,b2,b3,b4){
    if (b2||b3){
      pos.x=map.snapPX(pos.x);
      return;
    }
    if (b1||b4){
      pos.y=map.snapPX(pos.y);
    }
  }
  Entity getEnt(num px, num py){
    return map.entities[map.index(px, py)];
  }
 
  ///return if the two entities could collide based on their category and mask.
  ///returning true doesn't mean they actually collide at the moment.
  bool _could(Entity ent1, Entity ent2){
    Collision col1=colMap.getSafe(ent1);
    Collision col2=colMap.getSafe(ent2);
    if (col1==null || col2==null)return false;
    return ((col1.mask & col2.category)!=0) && ((col2.mask & col1.category)!=0);
  }
}