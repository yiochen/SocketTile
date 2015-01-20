part of gameworld;
class Position extends ComponentPoolable{
  num x, y;
  Position._();
  factory Position(num x, num y){
    Position position=new Poolable.of(Position,_constructor);
    position.x=x;
    position.y=y;
    return position;
  }
  static Position _constructor()=>new Position._();
}