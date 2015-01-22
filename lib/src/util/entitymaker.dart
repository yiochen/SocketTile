part of gameworld;

Entity newHero(GameWorld world){
      Entity entity=world.createEntity();
      
      var sprite=world.socketgame.characters.create(55,55,'figure');
      
      entity.addComponent(new Position(55,55));
      entity.addComponent(new Velocity(5));
      entity.addComponent(new Display(sprite));
      entity.addComponent(new Hero());
      entity.addToWorld();
      return entity;
    }