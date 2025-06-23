class GameObject {
  float x, y, vx, vy, size, hp, w, h, diff, strokeWeight, chance, fakeChance, cooldown;
  int opening, luck;
  color myColor;
  boolean open, opened, PickUp, done, active;




  GameObject(float x, float y, int luck, float hp) {
    //x and y of chest
    this.x=x;
    this.y=y;
    this.luck=luck;
    this.hp=hp;
    opening=0;
    chance=random(0, 100);
    fakeChance=random(0, 100);
    PickUp=false;
  }




  GameObject(color blue) {
    x = random(0, width);
    y =random(0, height);
    vx=vy=0;
    size=random(20, 100);
    hp=1;
    myColor = blue;
  }

  GameObject(float x, float y, float size, float hp, color blue) {
    this.x=x;
    this.y=y;
    this.size=size;
    this.hp=hp;
    this.myColor=blue;
    vx=vy=0;
  }
  GameObject(float x, float y, float size, float hp, color blue, float cooldown) {
    this.x=x;
    this.y=y;
    this.size=size;
    this.hp=hp;
    this.myColor=blue;
    this.cooldown=cooldown;
    vx=vy=0;
  }

  GameObject(float x, float y, float w, float h, color grey, float diff, int hp) {
    this.x=x;
    this.hp=hp;
    this.y=y;
    this.w=w;
    this.h=h;
    this.diff=diff;
    myColor=grey;
  }

  void show() {
    fill(myColor);
    noStroke();
    ellipse(x, y, size, size);
  }

  void act() {
    x=x+vx;
    y=y+vy;
  }

  boolean isDead() {
    if (hp<=0) return true;
    else return false;
  }

  //boolean badDie() {
  //  for (GameObject obj : objects) {
  //    if (obj instanceof badGuys) {
  //      badGuys bad = (badGuys)obj;
  //      if (bad.hp<=0) return true;
  //    } else return false;
  //  } 
  //}

  void pew() {
  }

  void Open() {
  }

  void B() {
  }

  void BadAct() {
  }
}
