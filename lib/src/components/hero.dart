part of gameworld;
class Hero extends ComponentPoolable{
  Hero._();
  factory Hero(){
    Hero hero=new Poolable.of(Hero, _constructor);
    return hero;  
  }
  static _constructor()=>new Hero._();
}