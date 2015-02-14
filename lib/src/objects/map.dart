part of gameworld;

class GameMap{
  ///how many tiles in a row
  int width;
  ///how may tiles in a column
  int height;
  ///how much is allowed for the movement correction, from 0 to half of the tilesize
  num threshold;
  
  
  List<int> data;
  List<Entity> entities;
  ///process Tiled json file and generate 
  GameMap.fromJSON(Map jsonMap){
      
      height=jsonMap['height'];
      width=jsonMap['width'];
      data=jsonMap['layers'][0]['data'];
      entities=new List(data.length);
      //only support square tile
      tilesize=jsonMap['tileheight'];
      threshold=tilesize/2;
  }
  /// return true if tile(x, y) is within the map
  
  bool inRange(int x,int y)=>x<this.width && y<this.height&&x>=0&&y>=0;
  Entity index2Entity(int index)=>entities[index];
  Entity coor2Entity(int x, int y)=>index2Entity(coor2index(x,y));
  Entity anchor2Entity(int px, int py)=>index2Entity(anchor2index(px,py));
  num get mapWidth=>width*tilesize;
  num get mapHeight=>height*tilesize;
  ///get the index of the tile that contains the point (px,py) in the data list
  int index(num px, num py)=>(py ~/ tilesize)*width+(px ~/ tilesize);
  
  int coor2index(int x, int y)=>y*width+x;
  ///find the tilecode of the tile in row y, column x
  int tilecode(int x, int y)=>data[coor2index(x,y)];
  
  Point topLeftPX(int x, int y)=>new Point(x*tilesize, y*tilesize);
  ///get anchor point coordinate in px. Anchor is the bottom left corner of the tile
  Point anchorPx(int x, int y)=>new Point(x*tilesize,(y+1)*tilesize);
  ///return the index of the tile whose anchor is at (px, py)
  ///for example, anchor2index(0,55) returns 0
  int anchor2index(int px, int py)=>(py ~/ tilesize-1)*width+(px ~/ tilesize);
  int index2x(int x)=>x % width;
  int index2y(int y)=>y ~/ width;
  
  num leftPX(int x)=>x*tilesize;
  num rightPX(int x)=>(x+1)*tilesize;
  num topPY(int y)=>y*tilesize;
  num bottomPY(int y)=>(y+1)*tilesize;
  
  //snap the x(or y) to the nearest intersection x(or y). in px
  num snapPX(num px){
    num low=(px ~/ tilesize)*tilesize;
    num high=((px~/ tilesize)+1)*tilesize;
    return (px-low)<(high-px)?low:high;
  }
  
  bool snappable(num px)=>(snapPX(px)-px).abs()<threshold;
  
}