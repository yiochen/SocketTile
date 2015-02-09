part of gameworld;
class Spawner extends ComponentPoolable{
  ///the entity that is spawned from this spawner
  ///If entity is null, this spawner is available, otherwise it is used.
  Entity entity;
  Spawner._();
  factory Spawner(){
    Spawner spawner=new Poolable.of(Spawner, _constructor);
    return spawner;
  }
  static Spawner _constructor()=>new Spawner._();
}
