part of game;
class PlayState extends State{
  
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
    socketgame.background=game.add.group();
    socketgame.groundMarks=game.add.group();
    socketgame.shadow=game.add.group();
    socketgame.bombs=game.add.group();
    socketgame.characters=game.add.group();
    socketgame.scene=new GameWorld(game.cache.getJSON('tiles'),socketgame); 
    socketgame.scene.init();
    
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
   
    
    
    rendermap(socketgame.scene.map);
    newHero(socketgame);
    
//    game.physics.enable(sprite);
    
    
   
    
  }
  
//  void createDeco() {
//    layer.getTiles(0, 0, layer.width,layer.height).forEach((tile){
//      if (tile.index==93){
//        group.create(tile.worldX,tile.worldY-game.rnd.pick([20,-20]),'deco');
//      }
//    });
//  }
  
  void rendermap(GameMap map) {
    for (int i=0;i<map.data.length;i++){
      
      newBlock(socketgame,map.data[i]-1,i);
    }
//    map.data.forEach((index){
//      
//    });
      
    }
  @override
  update(){
//    game.physics.arcade.collide(sprite, layer);
//    sprite.body.velocity.x=0;
//    sprite.body.velocity.y=0;
    socketgame.scene.process();
    socketgame.characters.sort('y',Group.SORT_ASCENDING);
//    socketgame.characters.customSort((spr1,spr2){
//      if (spr1.x-spr1.y<spr2.x-spr2.y)return 1;
//      if (spr1.x-spr1.y>spr2.x-spr2.y)return -1;
//      return 0;
//    });
    
  }
  
  
 
}