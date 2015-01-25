part of game;

class PreloadState extends State{
  SocketGame socketgame;
  Game game;
  PreloadState(this.socketgame){
    this.game=socketgame.game;
  }
  @override
  preload(){
    game.load.tilemap('map','assets/sampleTilemap.json',null,Tilemap.TILED_JSON);
    game.load.spritesheet('kenney', 'assets/kenney.png',55,55);
    game.load.image('figure','assets/phaser-dude.png');
    game.load.json('tiles', 'assets/sampleTilemap.json');
    game.load.image('deco', 'assets/bikkuriman.png');
    game.load.image('shadow', 'assets/shadow.png');
    game.load.atlasJSONHash('p1','assets/p1_walk.png','assets/p1_walk.json');
  }
  @override
  create(){
   
    game.state.start('play');
  }
  @override
  update(){
    
  }
}