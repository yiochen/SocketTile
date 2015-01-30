part of gameworld;
///Child contains a sprite.
///The difference with Display and Animation is that child won't be render by itself.
///It can only be added to a Display or Animation
///The default anchor point is bottom left

class Child extends ComponentPoolable{
  phaser.Sprite _sprite;
  
  Child._();
  factory Child(phaser.Sprite sprite,{num anchorX:0, num anchorY:1}){
    Child child=new Poolable.of(Child,_constructor);
    sprite.anchor.x=anchorX;
    sprite.anchor.y=anchorY;
    child._sprite=sprite;
    return child;
  }
  static Child _constructor()=>new Child._();
  @override
  void cleanUp(){
    //_sprite.removeChildren();
    _sprite.kill();
    _sprite=null;
  }
  phaser.Sprite get sprite{
    phaser.Sprite sp=_sprite.game.add.sprite(0, 0,_sprite.key);
    sp.anchor.x=_sprite.anchor.x;
    sp.anchor.y=_sprite.anchor.y;
    return sp;
    
  }
}