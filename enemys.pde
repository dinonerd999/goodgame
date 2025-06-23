class badGuys extends GameObject {
  badGuys(float x, float y, float size, float hp, color blue, float cooldown) {
    super(x, y, size, hp, blue, cooldown);
  }

  void BadAct() {
    super.BadAct();
    PVector move = PVector.sub(new PVector(myPlayer.x, myPlayer.y), new PVector(x, y) );
    move.setMag(1);

    if (dist(myPlayer.x, myPlayer.y, x, y)>20) {
      vx=move.x;
      vy=move.y;

      if (badIsInsideRoom(x-=vx, y-=vy) && dist(myPlayer.x, myPlayer.y, x, y)<30) {
        x-=vx;
        y-=vy;
      }
    }

    if (cooldown==0 && dist(myPlayer.x, myPlayer.y, x, y)<50) {
      objects.add(new badBullet(x, y, 3, 1, blue));
    }
    if (cooldown==0) {
      cooldown=60;
    }
    cooldown=cooldown-1;

    for (GameObject b : objects) {

      if (b instanceof Bullet) {
        
        if (dist(x, y, b.x, b.y)<10) {
          hp=hp-1;
          b.hp=0;
          
        }
      }
    }
  }
}




class badBullet extends GameObject {

  badBullet(float x, float y, float size, float hp, color blue) {
    super(x, y, size, hp, blue);
  }
  PVector move = PVector.sub(new PVector(myPlayer.x, myPlayer.y), new PVector(x, y) );

  void pew() {
    move.setMag(1);

    vx=move.x;
    vy=move.y;
    x=x+move.x;
    y=y+move.y;

    if (!isInsideRoom(x, y)) {
      hp = 0;
    }

    if (dist(x, y, myPlayer.x, myPlayer.y)< 5) {
      hp=0;
    }
  }

  void show() {
    super.show();
  }
}
