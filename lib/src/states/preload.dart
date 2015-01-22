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
    game.load.image('kenney', 'assets/kenney.png');
    game.load.image('figure','assets/phaser-dude.png');
    game.load.json('tiles', 'assets/sampleTilemap.json');
    game.load.image('deco', 'assets/bikkuriman.png');
  }
  @override
  create(){
   
    game.state.start('play');
  }
  @override
  update(){
    
  }
}