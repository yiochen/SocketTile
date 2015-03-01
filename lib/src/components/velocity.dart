part of gameworld;
class Velocity extends ComponentPoolable{
  num v;
  num maxV;
  int dir;
  
  Velocity._();
  factory Velocity(num maxV, int dir,{num v}){
    Velocity vel=new Poolable.of(Velocity, _constructor);
    vel.v=(v==null)?0:v;
    vel.maxV=maxV;
    vel.dir=dir;
    return vel;
  }
  static Velocity _constructor()=>new Velocity._();
}