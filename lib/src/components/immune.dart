part of gameworld;
///make the object immune to bomb damage
///players will become immune for some time after being hit by the bomb, prevent them from getting damage continuously
///Some blocks are always immune to any damage, making them undestroyable.
class Immune extends ComponentPoolable{
  Duration duration;
  DateTime startTime;
  Immune._();
  ///not passing in duration will cause duration to be null, which means the entity is permanently immuned. 
  factory Immune([int millisecond]){
    Immune imm=new Poolable.of(Immune, _constructor);
    if (millisecond!=null) imm.duration=new Duration(milliseconds: millisecond);
    imm.startTime=new DateTime.now();
    return imm;
  }
  static Immune _constructor()=>new Immune._();
}