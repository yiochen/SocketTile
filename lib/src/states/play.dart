part of game;
class PlayState extends State implements MessegeHandler{
  
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
    
    rendermap(socketgame.scene.map);
    
    var hero=newHero();
    game.input.keyboard.addKey(Keyboard.SPACEBAR).onDown.add((key){
      print('explosion!!!');
      Position pos=hero.getComponentByClass(Position);
      Velocity vel=hero.getComponentByClass(Velocity);
      newBomb(pos.x, pos.y, vel.dir);
    });
 
  }
  
  
  void rendermap(GameMap map) {
    for (int i=0;i<map.data.length;i++){
      
      newBlock(map.data[i]-1,i);
    }
   
    }
  @override
  update(){
//    game.physics.arcade.collide(sprite, layer);
//    sprite.body.velocity.x=0;
//    sprite.body.velocity.y=0;
    socketgame.scene.cleanDmgMap();
    socketgame.scene.process();
    socketgame.characters.sort('y',Group.SORT_ASCENDING);
//    socketgame.characters.customSort((spr1,spr2){
//      if (spr1.x-spr1.y<spr2.x-spr2.y)return 1;
//      if (spr1.x-spr1.y>spr2.x-spr2.y)return -1;
//      return 0;
//    });
    
  }

  @override
  void handle(String jsonString) {
    // TODO: implement handle
    Map message=JSON.decode(jsonString);
    switch (message["message"]){
      case m_newConn:
        //TODO: if new connection, save the id, create a cursor, add the hero
        break;
      case m_startmove:
        break;
      case m_endmove:
        //TODO:make sure when endmove, do not clear vel.dir. just change the v
        break;
    }
  }
}