part of gameworld;
class Stat extends ComponentPoolable{
  num hp;
  bool immunable;
  int immuneTime;
  
  Stat._();
  factory Stat(num hp,[bool immunable=false,int immuneTime]){
    Stat stat=new Poolable.of(Stat, _constructor);
    stat.hp=hp;
    stat.immunable=immunable;
    if (stat.immunable){
      //default provide half second of immune time;
      stat.immuneTime=(immuneTime!=null)?immuneTime:500;
    }
    return stat;
  }
  static Stat _constructor()=>new Stat._();
}