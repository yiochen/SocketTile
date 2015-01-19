part of player;

class Gamepad extends Sprite{
  static const RELEASE='release';
  static const TOUCHED='touched';
  static const CHANGE_DIR='change dir';
  
  num dir=null;
  
  
  Pointer pointer;
  Graphics stick;
  StreamController eventbus=new StreamController.broadcast();
  Stream get onEvent=>eventbus.stream;
  
  num r;//outer radius of the whole joystick
  num sR;//radius of the stick
  
  Gamepad(Game game,num x, num y,{this.r:100}) : super(game,x,y){
    sR=r/2.0;
    var circle=new Graphics(game);
    circle.lineStyle(0);
    circle.beginFill(0xA9D0F5);
    circle.drawCircle(0, 0, r);
    this.addChild(circle);
    stick=new Graphics(game);
    stick.lineStyle(0);
    stick.beginFill(0xFF0000);
    stick.drawCircle(0, 0, sR);
    this.addChild(stick);
    stick.x=0;
    stick.y=0;
  }
  
  ///find the square sum of the two number;
  num square(x,y)=>Math.pow(x, 2)+Math.pow(y,2);
  
  ///set the position of the stick according to the coordinate (x,y)
  ///x, y are global coordinates. they could be out of the gamepad area
  setPos(num x, num y){
    if (pointer!=null){
      
      var _x=relX(x);
      var _y=relY(y);
     
      var sq=square(_x,_y);
     
      var powerInner=Math.pow(sR, 2);
     
      if (sq>powerInner){
        var ratio=Math.sqrt(powerInner/sq);
        _x*=ratio;
        _y*=ratio;
      }
      stick.x=_x;
      stick.y=_y;
    //TODO if the coordinate is very closed to the center
    //break the method. otherwise might cause the dirction
    //to change violently when moving finger acoss the pad.
      var newDir=sign(Math.abs(_x)-Math.abs(_y))*2+sign(_y-_x);
      if (newDir!=dir){
        print('old dir $dir and new dir $newDir');
        if (dir!=null){
          //if this is not a new touch,emit change direction event.
          eventbus.add(CHANGE_DIR);
        }//otherwise, it is a new touch, new touch event has already be broadcasted
        dir=newDir;
        
      }
    }
  }
  ///release the joystick, make it return to original state.
  release(){
    
    stick.x=0;
    stick.y=0;
    pointer=null;
    eventbus.add(RELEASE);
  }
  ///touch down and start controlling the joystick
  touchdown(Pointer pointer){
    this.pointer=pointer;
    dir=STALL;
    eventbus.add(TOUCHED);
    setPos(pointer.x,pointer.y);
    
  }
  
  ///check if the global coordinate is within the range of the joystick
  bool within(num x, num y)=>square(relX(x),relY(y))<=Math.pow(r,2);
  
  num relX(num x)=>x-this.x;
  num relY(num y)=>y-this.y;
  num sign(num x)=>(x>0)?1:0;
  
  
  
  @override
  update(){
    if (pointer!=null) setPos(pointer.x, pointer.y);
    
  }
  
  
}