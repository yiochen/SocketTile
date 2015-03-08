part of gameworld;
class Account{
  int id;
  Entity hero;
  Control control;
  Account(int this.id){
    //TODO: change it to socket later
    control=new Control();
    hero=newHero(control);
    onDirDown(int keycode){
      Velocity vel=hero.getComponentByClass(Velocity);
      if (vel!=null){
        vel.dir=keycode;
        vel.v=vel.maxV;
      }
    }
    onDirUp(int keycode){
      Velocity vel=hero.getComponentByClass(Velocity);
      if (vel!=null){
        if (vel.dir==keycode) vel.v=0;
      } 
    }
    
    onBomb(int keycode){
      Position pos=hero.getComponentByClass(Position);
      Velocity vel=hero.getComponentByClass(Velocity);
      newBomb(pos.x,pos.y,vel.dir);
    }
    control.up.onDown=control.down.onDown=control.left.onDown=control.right.onDown=onDirDown;
    control.up.onUp=control.down.onUp=control.left.onUp=control.right.onUp=onDirUp;
    control.bomb.onDown=onBomb;
    gameworld.socketgame.controllSystem.add(id, control);
  }
  
  enableCursor(){
    phaser.CursorKeys cursor=gameworld.socketgame.game.input.keyboard.createCursorKeys();
    if (control.up.onDown!=null) cursor.up.onDown.add((key)=>control.up.onDown(d_UP));
    if (control.up.onUp!=null) cursor.up.onUp.add((key)=>control.up.onUp(d_UP));
    if (control.down.onDown!=null) cursor.down.onDown.add((key)=>control.down.onDown(d_DOWN));
    if (control.down.onUp!=null)cursor.down.onUp.add((key)=>control.down.onUp(d_DOWN));
    if (control.left.onDown!=null) cursor.left.onDown.add((key)=>control.left.onDown(d_LEFT));
    if (control.left.onUp!=null) cursor.left.onUp.add((key)=>control.left.onUp(d_LEFT));
    if (control.right.onDown!=null) cursor.right.onDown.add((key)=>control.right.onDown(d_RIGHT));
    if (control.right.onUp!=null) cursor.right.onUp.add((key)=>control.right.onUp(d_RIGHT));
    if (control.bomb.onDown!=null) gameworld.socketgame.game.input.keyboard.addKey(phaser.Keyboard.SPACEBAR).onDown.add((key)=>control.bomb.onDown(k_bomb));  
  }
  
}

class AccountManager{
  Map<int,Account> accounts;
  AccountManager(){
    accounts=new Map<int,Account>();
  }
  Account add(Account account)=>accounts[account.id]=account;
   
  Account get(int id)=>accounts[id];
  
}