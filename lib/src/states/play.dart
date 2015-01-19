part of game;
class PlayState extends State{
  Tilemap map;
  TilemapLayer layer;
  Sprite sprite;
  Group group;
  CursorKeys cursors;
  @override
  preload(){
    
  }
  @override
  create(){
   
    
    map=game.add.tilemap('map');
    
    map.addTilesetImage('kenney');
    layer=map.createLayer("Tile Layer 1");
//    layer.getTiles(0, 0, layer.width, layer.height).forEach((tile){
//      print('tile index ${tile.index} x: ${tile.x} y: ${tile.y}' );
//    });
    group=game.add.group();
    createDeco();
    //layer.debug=true;
    layer.resizeWorld();
    map.setCollisionByIndex(114);
    map.setCollisionByIndex(93);
    
    sprite=group.create(260,70,'figure');
    
    game.physics.enable(sprite);
    
    
    //DEBUG
    cursors=game.input.keyboard.createCursorKeys();
    
  }
  
  void createDeco() {
    layer.getTiles(0, 0, layer.width,layer.height).forEach((tile){
      if (tile.index==93){
        group.create(tile.worldX,tile.worldY-game.rnd.pick([20,-20]),'deco');
      }
    });
  }
  @override
  update(){
    game.physics.arcade.collide(sprite, layer);
    sprite.body.velocity.x=0;
    sprite.body.velocity.y=0;
    
    if (cursors.up.isDown){
      sprite.body.velocity.y=-200;
    }
    else if (cursors.down.isDown) {
      sprite.body.velocity.y = 200;
    }

    if (cursors.left.isDown) {
      sprite.body.velocity.x = -200;
    }
    else if (cursors.right.isDown) {
      sprite.body.velocity.x = 200;
    }
    group.sort('y',Group.SORT_ASCENDING);
  }
}