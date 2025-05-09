class Player extends GameObject {
  Player() {
    super(width/2, height/2, 20, 1, blue);
  }

  void act() {
    super.act();
    if (wKey) vy=-4;
    if (aKey) vx=-4;
    if (sKey) vy=4;
    if (dKey) vx=4;
    if (!wKey && !sKey) vy=0;
    if (!aKey && !dKey) vx=0;
    if (x>width) x=width;
    if (x<0) x=0;
    if (y>height) y=height;
    if (y<0) y=0;
    shoot();
  }

  void shoot() {
    if (mousePressed) {
      objects.add(new Bullet());
    }
  }
}
