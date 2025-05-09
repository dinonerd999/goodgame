class Bullet extends GameObject {
  Bullet() {
    super(myPlayer.x, myPlayer.y, 5, 1, blue);
    vx=0;
    vy=-10;
  }
  void act() {
   super.act();
   if (x<0 || x> width || y<0 || y>height) {
     hp=0;
   }
  }
}
