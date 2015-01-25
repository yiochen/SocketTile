part of gameworld;
class Collision extends ComponentPoolable{
  static int DEFAULT=0x0001;
  static int BLOCK=0x0002;
  static int FIGURE=0x0004;
  static int BUSH=0x0008;
  static int ALL=0xFFFF;
  static int NONE=0x0000;
  
  int category;
  int mask;
  
  Collision._();
  factory Collision([int category,int mask]){
    Collision col=new Poolable.of(Collision, _constructor);
    col.category=(category==null)?DEFAULT:category;
    col.mask=(mask==null)?ALL:mask;
    return col;
  }
  static Collision _constructor()=>new Collision._();
}