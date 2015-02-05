part of gameworld;
class DamageSystem extends EntityProcessingSystem{
  List<num> dmgMap;
  ComponentMapper<Stat> statMap;
  ComponentMapper<Position> posMap;
  
  GameMap map;
  DamageSystem(this.map,this.dmgMap):super(Aspect.getAspectForAllOf([Stat,Position]));
  
  @override
  void initialize(){
    statMap=new ComponentMapper<Stat>(Stat, world);
    posMap=new ComponentMapper<Position>(Position, world); 
  }
  @override
  void processEntity(Entity entity){
    Position pos=posMap.get(entity);
    Stat stat=statMap.get(entity);
    num dmg=dmgMap[map.anchor2index(map.snapPX(pos.x), map.snapPX(pos.y))];
    if (dmg==0)return;
    Immune imm=entity.getComponentByClass(Immune);
    if (imm==null){
      //no immune, receive damage
      stat.hp+=dmg;
      print('receive damage at ${pos.x},${pos.y}, current hp: ${stat.hp}');
      //if the entity is dead by the damage, remove it
      if (stat.hp<=0) {
        entity.deleteFromWorld();
        print('die at ${pos.x},${pos.y} , current hp: ${stat.hp}');
      }else if (stat.immunable){
        //if the entity is immunable, acquir immune. 
        entity.addComponent(new Immune(stat.immuneTime));
        entity.changedInWorld();
        print('gain immunity at ${pos.x},${pos.y}, current hp: ${stat.hp}');
      }
    }else {
      //under protection no damage
      print('under immune at ${pos.x},${pos.y}, current hp: ${stat.hp}');
    }
    
    
    
  }
}