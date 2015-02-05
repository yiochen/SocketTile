part of gameworld;
class DamageSystem extends EntityProcessingSystem{
  List<num> dmgMap;
  ComponentMapper<Stat> statMap;
  ComponentMapper<Position> posMap;
  
  GameMap map;
  DamageSystem(this.map):super(Aspect.getAspectForAllOf([Stat,Position]));
  
  @override
  void initialize(){
    statMap=new ComponentMapper<Stat>(Stat, world);
    dmgMap=new List<num>.filled(map.height*map.width,0);
    posMap=new ComponentMapper<Position>(Position, world); 
  }
  @override
  void processEntity(Entity entity){
    Position pos=posMap.get(entity);
    Stat stat=statMap.get(entity);
    Immune imm=entity.getComponentByClass(Immune);
    if (imm==null){
      //no immune, receive damage
      stat.hp-=dmgMap[map.index(pos.x, pos.y)];
      //if the entity is dead by the damage, remove it
      if (stat.hp<=0) {
        entity.deleteFromWorld();
      }else if (stat.immunable){
        //if the entity is immunable, acquir immune. 
        entity.addComponent(new Immune(stat.immuneTime));
      }
    }else {
      //under protection no damage
    }
    
    
    
  }
}