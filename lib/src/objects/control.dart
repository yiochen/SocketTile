part of game;
typedef void KeyAction(int keycode);
class GameKey{
  bool isDown=false;
  Function onDown;
  Function onUp;
  GameKey({KeyAction this.onDown, KeyAction this.onUp});
}

class Control{
  GameKey up;
  GameKey down;
  GameKey left;
  GameKey right;
  GameKey bomb;
  Function update;
  
  Control(){
    up=new GameKey();
    down=new GameKey();
    left=new GameKey();
    right=new GameKey();
    bomb=new GameKey();
    update=(){};
  }
  
  
 
}
class ControllSystem{
  Map<int,Control> controls;
  ControllSystem(){
    controls=new Map<int,Control>();
  }
  
  update(){
    controls.forEach((i,e)=>e.update());
  }
  add(int i, Control control)=>(controls[i]=control);
  Control get(int i)=>controls[i];
}