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
    
    socketgame.background=game.add.group();
    socketgame.groundMarks=game.add.group();
    socketgame.shadow=game.add.group();
    socketgame.bombs=game.add.group();
    socketgame.characters=game.add.group();
    socketgame.scene=new GameWorld(game.cache.getJSON('tiles'),socketgame); 
    socketgame.scene.init();
    
    rendermap(socketgame.scene.map);
    
    //TODO: following if statement is for debug only.
    if (socketgame.offline){
      //TODO: make delete the following lines, add new account when connected.
      Account account=gameworld.accManager.add(new Account(1));
      account.enableCursor();
    }
    
 
  }
  
  
  void rendermap(GameMap map) {
    for (int i=0;i<map.data.length;i++){
      
      newBlock(map.data[i]-1,i);
    }
   
    }
  @override
  update(){
    socketgame.controllSystem.update();
    socketgame.scene.cleanDmgMap();
    socketgame.scene.process();
    socketgame.characters.sort('y',Group.SORT_ASCENDING);

    
  }
  
  ///handle message sent from server or controller
  @override
  void handle(String jsonString) {
    // TODO: implement handle
    Map message=JSON.decode(jsonString);
    switch (message["message"]){
      case m_newConn:
        //TODO: if new connection, save the id, create a cursor, add the hero
        int id=message["id"];
        gameworld.accManager.add(new Account(id));
        break;
      case m_startmove:
        int id=message['id'];
        Control control=socketgame.controllSystem.get(id);
        //TODO: change the control
        break;
      case m_endmove:
        //TODO:make sure when endmove, do not clear vel.dir. just change the v
        break;
    }
  }
}