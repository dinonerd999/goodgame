class Player extends GameObject {
  Player() {
    super(width/2, height/2, 5, 10, tan);
  }


  void act() {
    super.act();
    shoot();

    for (GameObject b : objects) {

      if (b instanceof badBullet) {

        if (dist(x, y, b.x, b.y)<10) {
          b.hp=b.hp-1;
          hp=hp-1;
          println(hp);
        }
      }
    }
  }



  void shoot() {
    //println(shootCooldown);
    float Bx=0,By=0;
    if (mousePressed && shootCooldown==0) {
      if (weaponHeld==PISTOL || weaponHeld==SKS) {
        objects.add(new Bullet());
        shootCooldown=60;
        shot=true;
      }
      if (weaponHeld==DUEL) {
        objects.add(new Bullet());
        PVector aim = PVector.sub(new PVector(mx, my), new PVector(myPlayer.x, myPlayer.y));
        PVector OffsetL = aim.copy();
        OffsetL.rotate(20);
        OffsetL.setMag(4);
        aim.setMag(10);
        Bx=OffsetL.x;
        By=OffsetL.y;
        objects.add(new Bullet(Bx, By, aim.x, aim.y));
        //println(shootCooldown);

        shootCooldown=60;
        shot=true;
      }
    }
  }
}
