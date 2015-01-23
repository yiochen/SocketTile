part of gameworld;

Entity newHero(socketgame){
  Entity entity=socketgame.scene.createEntity();
      
  phaser.Sprite sprite=socketgame.characters.create(0,0,'p1');
  sprite.animations.add('stand',phaser.Animation.generateFrameNames('Symbol 2 instance ',10000,10000,'',5),15,true);
  sprite.animations.add('walk',phaser.Animation.generateFrameNames('Symbol 2 instance ',10001,10010,'',5),2,true);
  sprite.animations.play('stand');
  entity.addComponent(new Position(55,110));
  entity.addComponent(new Velocity(5));
  entity.addComponent(new Animation(sprite));
  entity.addComponent(new Hero());
  entity.addToWorld();
  return entity;
}
Entity newBlock(SocketGame socketgame, int type, int pos,{GameMap gamemap}){
  var map=(gamemap==null)?socketgame.scene.map:gamemap;
  Point anchor=map.anchorPx(map.index2x(pos), map.index2y(pos));
  Entity entity=socketgame.scene.createEntity();
  phaser.Group group;
  if (type==t_GROUND){
    group=socketgame.background;
    
  }else{
    group=socketgame.characters;
  }
  phaser.Sprite sprite=group.create(0,0,'kenney',type);
  entity.addComponent(new Position(anchor.x,anchor.y));
  entity.addComponent(new Display(sprite));
  entity.addComponent(new Block());
  entity.addToWorld();
  return entity;
}