part of gameworld;

Entity newHero(){
  SocketGame socketgame=gameworld.socketgame;
  Entity entity=socketgame.scene.createEntity();
  phaser.Sprite sprite=socketgame.characters.create(0,0,'p1');
  sprite.animations.add('stand',phaser.Animation.generateFrameNames('Symbol 2 instance ',10000,10000,'',5),15,true);
  sprite.animations.add('walk',phaser.Animation.generateFrameNames('Symbol 2 instance ',10001,10010,'',5),2,true);
  sprite.animations.play('stand');
  Entity spawner=socketgame.scene.spawners.where((entity)=>(entity.getComponentByClass(Spawner) as Spawner).entity==null).last;
  Position pos=spawner.getComponentByClass(Position);
  entity.addComponent(new Position(pos.x,pos.y));
  entity.addComponent(new Velocity(5,d_RIGHT));
  
  entity.addComponent(new Animation(sprite));
  entity.addComponent(new Hero());
  entity.addComponent(new Collision(Collision.FIGURE,Collision.ALL));
  entity.addComponent(new Stat(1000,true,500));
  phaser.Sprite shadow=socketgame.shadow.create(0,0,'shadow');
  entity.addComponent(new Shadow(shadow));
  entity.addToWorld();
  
  return entity;
}

Entity newBomb(num px,num py,int dir){
  SocketGame socketgame=gameworld.socketgame;
  Entity entity=socketgame.scene.createEntity();
  phaser.Sprite sprite=socketgame.bombs.create();
  print('making new bomb, sprite is ${sprite.alive}');
  phaser.Sprite explosion=socketgame.game.add.sprite(0, 0,'explosion');

  GameMap map=socketgame.scene.map;
  px=map.snapPX(px);
  py=map.snapPX(py);
  sprite.x=px;
  sprite.y=py;
  print('new bomb at $px, $py, toward $dir');
  entity.addComponent(new Position(px,py));
  entity.addComponent(new Display(sprite));
  entity.addComponent(new Child(explosion));
  entity.addComponent(new Bomb(100,dir,range:5,length:3));
  Timer timer=new Timer.limited(500,10);
  entity.addComponent(timer);
  print('timer loop: ${timer.loop} checked: ${timer.checked}');
  entity.addToWorld();
  return entity;
}

Entity newBlock(int type, int pos,[GameMap gamemap]){
  SocketGame socketgame=gameworld.socketgame;
  Entity entity;
  if ((entity=tileGround(type,pos,gamemap))!=null) return entity;
  if ((entity=tileSpawn(type,pos,gamemap))!=null) return entity;
  if ((entity=tileBorder(type,pos,gamemap))!=null) return entity;
  return tileDefault(type,pos,gamemap);
}
Entity tileGround(int type, int pos,[GameMap gamemap]){
  SocketGame socketgame=gameworld.socketgame;
  if (type==t_GROUND){
    GameMap map=(gamemap==null)?socketgame.scene.map:gamemap;
    Point anchor=map.anchorPx(map.index2x(pos), map.index2y(pos));
    Entity entity=socketgame.scene.createEntity();
    phaser.Group group=socketgame.background;
    phaser.Sprite sprite=group.create(0,0,'kenney',type);
    entity.addComponent(new Position(anchor.x,anchor.y));
    entity.addComponent(new Display(sprite));
    entity.addComponent(new Block());
    entity.addComponent(new Collision(Collision.DEFAULT,Collision.NONE));
    //map.entities[pos]=entity;
    entity.addToWorld();
    return entity;
  }else return null;
}
Entity tileBorder(int type, int pos, [GameMap gamemap]){
  SocketGame socketgame=gameworld.socketgame;
  if (type==t_BOARDER){
    GameMap map=(gamemap==null)?socketgame.scene.map:gamemap;
    tileGround(t_GROUND,pos,map);
    Point anchor=map.anchorPx(map.index2x(pos), map.index2y(pos));
    Entity entity=socketgame.scene.createEntity();
    phaser.Group group=socketgame.characters;
    phaser.Sprite sprite=group.create(0,0,'kenney',type);
    entity.addComponent(new Position(anchor.x,anchor.y));
    entity.addComponent(new Display(sprite));
    entity.addComponent(new Block());
    
    entity.addComponent(new Collision(Collision.DEFAULT,Collision.ALL));
    map.entities[pos]=entity;
    entity.addToWorld();
    return entity;
  }else return null;
}
Entity tileSpawn(int type,int pos,[GameMap gamemap]){
  SocketGame socketgame=gameworld.socketgame;
  if (type==t_SPAWN){
    GameMap map=(gamemap==null)?socketgame.scene.map:gamemap;
    Point anchor=map.anchorPx(map.index2x(pos), map.index2y(pos));
    Entity entity=socketgame.scene.createEntity();
    phaser.Group group=socketgame.background;
    group.create(anchor.x,anchor.y-tilesize,'kenney',t_GROUND);
    phaser.Sprite sprite=group.create(0,0,'kenney',type);
    entity.addComponent(new Position(anchor.x,anchor.y));
    entity.addComponent(new Display(sprite));
    entity.addComponent(new Block());
    entity.addComponent(new Spawner());
    entity.addComponent(new Collision(Collision.DEFAULT,Collision.NONE));
    map.entities[pos]=entity;
    entity.addToWorld();
    socketgame.scene.spawners.add(entity);
    return entity;
  }else return null;
}
Entity tileDefault(int type, int pos, [GameMap gamemap]){
  SocketGame socketgame=gameworld.socketgame;
  //add requirement here
  if (true){
    GameMap map=(gamemap==null)?socketgame.scene.map:gamemap;
    tileGround(t_GROUND,pos,map);
    Point anchor=map.anchorPx(map.index2x(pos), map.index2y(pos));
    Entity entity=socketgame.scene.createEntity();
    phaser.Group group;
    group=socketgame.characters;
    phaser.Sprite sprite=group.create(0,0,'kenney',type);
    entity.addComponent(new Position(anchor.x,anchor.y));
    entity.addComponent(new Display(sprite));
    entity.addComponent(new Block());
    entity.addComponent(new Stat(10,false));
    entity.addComponent(new Collision(Collision.DEFAULT,Collision.ALL));
    map.entities[pos]=entity;
    entity.addToWorld();
    return entity;
  }else return null;
}