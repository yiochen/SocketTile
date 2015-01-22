part of gameworld;
class Block extends ComponentPoolable{
  Block._();
  factory Block(){
    Block block=new Poolable.of(Block,_contructor);
    return block;
  }
  static Block _contructor()=>new Block._();
}