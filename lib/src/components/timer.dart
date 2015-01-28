part of gameworld;
class Timer extends ComponentPoolable{
  int duration;
  DateTime starttime;
  int loop;
  int maxLoop;
  bool checked;
  
  Timer._(){
    this.checked=false;
    this.starttime=new DateTime.now();
    this.loop=0;
  }
  
  factory Timer.once(int duration){
    Timer timer=new Poolable.of(Timer, _constructor);
    timer.maxLoop=1;
    timer.checked=false;
    timer.duration=duration;
    return timer;
  }
  factory Timer.forever(int duration){
    Timer timer=new Poolable.of(Timer,_constructor);
    timer.maxLoop=2147483647;
    timer.checked=false;
    timer.duration=duration;
    return timer;
  }
  factory Timer.limited(int duration, int loops){
    Timer timer=new Poolable.of(Timer,_constructor);
    timer.maxLoop=loops;
    timer.checked=false;
    timer.duration=duration;
    return timer;
  }
  static Timer _constructor()=>new Timer._();
}