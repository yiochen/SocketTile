part of gameworld;
class TimerSystem extends EntityProcessingSystem{
  ComponentMapper<Timer> timeMap;
  TimerSystem():super(Aspect.getAspectForAllOf([Timer]));
  @override
  void initialize(){
    timeMap=new ComponentMapper<Timer>(Timer,world);
  }
  @override
  void processEntity(Entity entity){
    Timer timer=timeMap.get(entity);
    if (timer.loop<timer.maxLoop && !timer.finished){
      DateTime now=new DateTime.now();
      if (now.difference(timer.starttime).inMilliseconds>=timer.duration){
        
        timer.checked=false;
        timer.loop++;
        print('timer tick ${timer.loop}');
        timer.starttime=now;    
        if (timer.nextCall!=null){
          timer.nextCall();
          timer.nextCall=null;
        }
      }
    }else{
      timer.finished=true;
    }
    
  }
  
}