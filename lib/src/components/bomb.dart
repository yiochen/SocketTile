part of gameworld;
class Bomb extends ComponentPoolable{
  num dmg;
  ///how far can the explosion reach
  int range;
  ///how long can the explosion expand.
  int length;
  int dir;
  ///whether or not the damage has been deducted.
  bool checked=false;
  ///how long does explosion take to spread to the next position
  int time=1000;
  List<phaser.Sprite> splash;
  Bomb._();
  factory Bomb(num dmg,int dir,{int range,int length}){
    Bomb bomb=new Poolable.of(Bomb,_constructor);
    bomb.dmg=dmg;
    bomb.dir=dir;
    bomb.range=(range!=null)?range:100;
    bomb.length=(length!=null)?length:1;
    bomb.splash=new List();
    
    return bomb;
  }
  static Bomb _constructor()=>new Bomb._();
}