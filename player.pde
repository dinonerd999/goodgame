class Player extends GameObject {
  Player() {
    super(width/2, height/2, 5, 1, blue);
  }

  void act() {
    super.act();
    if (wKey) vy=-velocity;
    if (aKey) vx=-velocity;
    if (sKey) vy=velocity;
    if (dKey) vx=velocity;
    if (!wKey && !sKey) vy=0;
    if (!aKey && !dKey) vx=0;
    if (x>width) x=width;
    if (x<0) x=0;
    if (y>height) y=height;
    if (y<0) y=0;
    shoot();
  }

  void shoot() {
    if (mousePressed && shootCooldown==0) {
      objects.add(new Bullet());
      
      shootCooldown=60;
      shot=true;
      screenShakeTimer=5;
      
      
      
      
    }
  }
}
