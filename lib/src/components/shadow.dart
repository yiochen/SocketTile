part of gameworld;
class Shadow extends ComponentPoolable{
  phaser.Sprite sprite;
  
  Shadow._();
  factory Shadow(phaser.Sprite sprite){
    Shadow shadow=new Poolable.of(Shadow, _constructor);
    shadow.sprite=sprite;
    shadow.sprite.anchor.y=1;
    return shadow;
  }
  static Shadow _constructor()=>new Shadow._();
}