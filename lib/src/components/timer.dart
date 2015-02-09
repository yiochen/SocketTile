part of gameworld;
class Timer extends ComponentPoolable{
  int duration;
  DateTime starttime;
  int loop;
  int maxLoop;
  bool finished;
  bool checked;
  Function nextCall;
  Timer._();
  void init(){
    this.checked=true;
    this.starttime=new DateTime.now();
    this.loop=0;
    this.finished=false;
    this.nextCall=null;
  }
  factory Timer.once(int duration){
    Timer timer=new Poolable.of(Timer, _constructor);
    timer.init();
    timer.maxLoop=1;
    timer.checked=false;
    timer.duration=duration;
    return timer;
  }
  factory Timer.forever(int duration){
    Timer timer=new Poolable.of(Timer,_constructor);
    timer.init();
    timer.maxLoop=2147483647;
    timer.checked=false;
    timer.duration=duration;
    return timer;
  }
  factory Timer.limited(int duration, int loops){
    print('new timer');
    Timer timer=new Poolable.of(Timer,_constructor);
    timer.init();
    timer.maxLoop=loops;
    timer.checked=false;
    timer.duration=duration;
    return timer;
  }
  
  static Timer _constructor()=>new Timer._();
}