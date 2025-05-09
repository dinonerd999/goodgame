import java.util.ArrayList;
ArrayList<GameObject> objects;
boolean wKey, aKey, sKey, dKey;
float x,y;
int velocity;
float gameObject;
color blue=#0064C8;
Player myPlayer;


void setup() {
  myPlayer= new Player();
  size(2000, 1000);
  velocity=5;
  x=1000;
  y=500;
  objects = new ArrayList<GameObject>();
  objects.add(myPlayer);
}


void draw() {
  game();
  //if (wKey) y=y-velocity;
  //if (aKey) x=x-velocity;
  //if (sKey) y=y+velocity;
  //if (dKey) x=x+velocity;
  //fill(0,255,0);
  //circle(x, y, 50);
}



void keyPressed() {
  if (key=='w') wKey=true;
  if (key=='a') aKey=true;
  if (key=='s') sKey=true;
  if (key=='d') dKey=true;
}

void keyReleased() {
  if (key=='w') wKey=false;
  if (key=='a') aKey=false;
  if (key=='s') sKey=false;
  if (key=='d') dKey=false;
}
