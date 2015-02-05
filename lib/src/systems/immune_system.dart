part of gameworld;
class ImmuneSystem extends EntityProcessingSystem{
  ComponentMapper<Immune> immMap;
  ImmuneSystem():super(Aspect.getAspectForAllOf([Immune]));
  @override
  void initialize(){
    immMap=new ComponentMapper<Immune>(Immune,world);
  }
  @override
  void processEntity(Entity entity){
    Immune imm=immMap.get(entity);
    if (imm.duration!=null){
      //if the object is not permanently immuned.
      (entity.getComponentByClass(Animation) as Animation).sprite.tint=0x00FF00;
      //check the time
      DateTime now=new DateTime.now();
      if (now.difference(imm.startTime)>imm.duration){
        //immune ends, delete component
        entity.removeComponent(Immune);
        entity.changedInWorld();
        print('immune ends');
        (entity.getComponentByClass(Animation) as Animation).sprite.tint=0xFFFFFF;
      }
    }
  }
}