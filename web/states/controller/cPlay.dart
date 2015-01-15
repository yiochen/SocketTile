//controller play.dart
part of controller;

class c_PlayState extends State{
  @override
  preload(){
    
  }
  @override
  create(){
    document.onClick.listen((MouseEvent e){
          Map clickMessage={'from':'controller','message':'click'};
          ws.send(JSON.encode(clickMessage));
    });
  }
  @override
  update(){
    
  }
}