class GameObject {
   float x, y, vx, vy, size, hp; 
   color myColor;
   
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
   
   void show() {
     fill(myColor);
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
}
