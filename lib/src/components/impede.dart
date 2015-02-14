part of gameworld;
///equip entity with this component to make it impede explosion.
///Should be used only on blocks.
///hero cannot won't impede explosion, otherwise would be too powerful.
class Impede extends ComponentPoolable{
  ///if an explosion reach a 'reduce' object, the explosion span will decrease. if the span is reduced to 0, the explosion disappears
  bool reduce;
  ///if an explosion reach a 'vanish' object, the explosion will just disappear completely.
  ///if both vanish and reduce are set to true. Only vanish will be considered.
  bool vanish;
  
  Impede._();
  factory Impede({bool reduce:false, bool vanish:true}){
    Impede impede=new Poolable.of(Impede,_constructor);
    impede.vanish=vanish;
    impede.reduce=impede.vanish?false:reduce;
    return impede;
  }
  static Impede _constructor()=>new Impede._();
}