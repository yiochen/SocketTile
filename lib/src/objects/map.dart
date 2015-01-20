part of gameworld;

class GameMap{
  int width;
  int height;
  num threshold;
  ///tilesize in px
  num tilesize;
  
  List<int> data;
  ///process Tiled json file and generate 
  GameMap.fromJSON(Map jsonMap){
      height=jsonMap['height'];
      width=jsonMap['width'];
      data=jsonMap['layers'][0]['data'];
      //only support square tile
      tilesize=jsonMap['tileheight'];
      threshold=tilesize/5;
  }
  
  num get mapWidth=>width*tilesize;
  num get mapHeight=>height*tilesize;
  int index(int x, int y)=>data[y*width+x];
  Point topLeftPX(int x, int y)=>new Point(x*tilesize, y*tilesize);
  
  num leftPX(int x)=>x*tilesize;
  num rightPX(int x)=>(x+1)*tilesize;
  num topPY(int y)=>y*tilesize;
  num bottomPY(int y)=>(y+1)*tilesize;
  /// return the nearest unit coordinate in the tilemap 
  /// for example snap(51,51) will return Point(1,1)
  Point snap(num x, num y){
    num low=x/tilesize;
    String a='ss';
    
    return new Point(0,0);
  }
  Point snap2px(num x, num y){
    return new Point(0,0);
  }
}