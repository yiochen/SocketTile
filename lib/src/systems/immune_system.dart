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
      //check the time
      DateTime now=new DateTime.now();
      if (now.difference(imm.startTime)>imm.duration){
        //immune ends, delete component
        entity.removeComponent(Immune);
        print('immune ends');
      }
    }
  }
}