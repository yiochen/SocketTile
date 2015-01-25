part of gameworld;
class Shadow extends ComponentPoolable{
  phaser.Sprite sprite;
  
  Shadow._();
  factory Shadow(SocketGame game){
    Shadow shadow=new Poolable.of(Shadow, _constructor);
    shadow.sprite=game.shadow.create(0,0,'shadow');
    shadow.sprite.anchor.y=1;
    return shadow;
  }
  static Shadow _constructor()=>new Shadow._();
}