//controller play.dart
part of player;

class c_PlayState extends State{
  Gamepad gamepad;
  @override
  preload(){
    
  }
  @override
  create(){
//    var graphics=game.add.graphics(0,0);
//    graphics.beginFill(0xFF3300);
//    graphics.lineStyle(10,0xffd900,1);
//    graphics.moveTo(0, 50);
//    graphics.lineTo(250, 50);
//    graphics.lineTo(100, 100);
//    graphics.lineTo(250,220);
//    graphics.lineTo(50, 220);
//    graphics.lineTo(0, 50);
//    graphics.endFill();
    addGamePad();
    game.input.addPointer();
    handleInput();
    document.onClick.listen((MouseEvent e){
          
          ws.send(clickM(TAG));
    });
  }
  
  void handleInput() {
    game.input.onDown.add(onTouchDown);
    game.input.onUp.add(onTouchUp);
  }
  
  void addGamePad() {
    gamepad=new Gamepad(game, 100, 200);
    game.add.existing(gamepad);
  }
  @override
  update(){
    gamepad.update();
    //print("width: ${game.canvas.width} and height: ${game.canvas.height}");
  }
  render(){
    game.debug.pointer(game.input.mousePointer);
    game.debug.pointer(game.input.pointers[1]);
    game.debug.pointer(game.input.pointers[2]);
    game.debug.pointer(game.input.pointers[3]);
  }
  
  void onTouchDown(Pointer pointer, dynamic event) {
    if (gamepad.within(pointer.x,pointer.y)){
      gamepad.touchdown(pointer);
    }
  }
  
  void onTouchUp(Pointer pointer, dynamic event) {
    if (gamepad.pointer==pointer){
      gamepad.release();
    }
  }
}