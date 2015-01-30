part of gameworld;
///handle static sprite.
///anchor point is at the bottom left corner;
class Display extends ComponentPoolable{
  phaser.Sprite sprite;
  
  Display._();
  factory Display(phaser.Sprite sprite){
    Display dis=new Poolable.of(Display,_constructor);
    sprite.anchor=new phaser.Point(0,1);
    dis.sprite=sprite; 
    return dis;
  }
  @override
  void cleanUp(){
    //sprite.removeChildren();
    sprite.kill();
    sprite=null;
  }
  static Display _constructor()=>new Display._();
}