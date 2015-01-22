part of gameworld;
class Display extends ComponentPoolable{
  phaser.Sprite sprite;
  
  Display._();
  factory Display(phaser.Sprite sprite){
    Display dis=new Poolable.of(Display,_constructor);
    dis.sprite=sprite;
    sprite.anchor=new phaser.Point(0,1);
    return dis;
  }
  
  static Display _constructor()=>new Display._();
}