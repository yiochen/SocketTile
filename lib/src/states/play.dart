part of game;
class PlayState extends State{
  GameWorld scene=null;
  
//  Tilemap map;
//  TilemapLayer layer;
  Sprite sprite;
  
  
  SocketGame socketgame;
  Game game;
  
  PlayState(this.socketgame){
    this.game=socketgame.game;
  }
  
  
  @override
  preload(){
    
  }
  @override
  create(){
    //DEBUG
    socketgame.characters=game.add.group();
    scene=new GameWorld(game.cache.getJSON('tiles'),socketgame); 
    scene.initialize();
//    map=game.add.tilemap('map');
//    
//    
//    map.addTilesetImage('kenney');
//    layer=map.createLayer("Tile Layer 1");
    //by setting visible to false will prevent the tilemap from rendering.
//    layer.visible=true;
//    layer.getTiles(0, 0, layer.width, layer.height).forEach((tile){
//      print('tile index ${tile.index} x: ${tile.x} y: ${tile.y}' );
//    });
    
//    createDeco();
    //layer.debug=true;
//    layer.resizeWorld();
//    map.setCollisionByIndex(114);
//    map.setCollisionByIndex(93);
   
    
    
    
    newHero(scene);
//    game.physics.enable(sprite);
    
    
   
    
  }
  
//  void createDeco() {
//    layer.getTiles(0, 0, layer.width,layer.height).forEach((tile){
//      if (tile.index==93){
//        group.create(tile.worldX,tile.worldY-game.rnd.pick([20,-20]),'deco');
//      }
//    });
//  }
  @override
  update(){
//    game.physics.arcade.collide(sprite, layer);
//    sprite.body.velocity.x=0;
//    sprite.body.velocity.y=0;
    scene.process();
   
    socketgame.characters.sort('y',Group.SORT_ASCENDING);
  }
  
  
 
}