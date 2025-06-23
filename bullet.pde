class Bullet extends GameObject {

  Bullet() {



    //Bullet(float x, float y, float size, float hp, color blue) {
    super(myPlayer.x, myPlayer.y, 1.5, 1, blue);
    //}

    // give bullet more size so it's visible

    // Aim directly from player center to mouse position
    if (weaponHeld==PISTOL || weaponHeld==SKS) {
      PVector aim = PVector.sub(new PVector(mx, my), new PVector(myPlayer.x, myPlayer.y));
      aim.setMag(10); // or however fast you want the bullet to be
      // faster bullet speed

      vx = aim.x;
      vy = aim.y;
    }
    if (weaponHeld==DUEL) {
      PVector aim = PVector.sub(new PVector(mx, my), new PVector(myPlayer.x, myPlayer.y));
      PVector OffsetL = aim.copy();
      OffsetL.rotate(20);
      OffsetL.setMag(4);
      aim.setMag(10);
      vx=aim.x;
      vy=aim.y;
      x-=OffsetL.x;
      y-=OffsetL.y;
    }
  }
  Bullet(float x,float y,float aimX,float aimY){
    super(myPlayer.x+x, myPlayer.y+y, 1.5, 1, blue);
    vx=aimX;
    vy=aimY;
  }

  void act() {
    super.act();

    // Kill bullet if out of bounds
    if (x < 0 || x > width || y < 0 || y > height) {
      hp = 0;
    }

    // Kill bullet if it hits a wall
    if (!isInsideRoom(x, y)) {
      hp = 0;
    }
  }

  void draw() {
    fill(blue);
    noStroke();





    ellipse(x, y, w, h);
  }
}
