part of gameworld;
///handle moving sprite
///anchor point is at the button center
class Animation extends ComponentPoolable{
  phaser.Sprite sprite;
  
  Animation._();
  factory Animation(phaser.Sprite sprite){
    Animation anim=new Poolable.of(Animation, _constructor);
    anim.sprite=sprite;
    sprite.anchor=new phaser.Point(0.5,1);
    return anim;
  }
  
  static Animation _constructor()=>new Animation._();
}