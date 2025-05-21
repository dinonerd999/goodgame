import java.util.ArrayList;
ArrayList<GameObject> objects;
boolean wKey, aKey, sKey, dKey;
float x, y;
int velocity;
float gameObject;
color blue=#0064C8, grey=#818181, tan=#A09D6A, brown=#4D352F;
float shootCooldown;
boolean shot;
int screenShakeTimer;
//float playerX = 1000;
//float playerY = 500;

Player myPlayer;



float zoom = 5.0;     
float camX = 0;     
float camY = 0;       
float smoothSpeed = 0.1;

void setup() {
  myPlayer= new Player();
  size(2000, 1000);
  velocity=1;
  x=1000;
  y=500;
  objects = new ArrayList<GameObject>();
  objects.add(myPlayer);
  shot=false;
  generateDungeon();
}


void draw() {
  playerMove();
  background(20);
  
  

  float targetX = myPlayer.x - width / (2 * zoom) + myPlayer.size / 2;
  float targetY = myPlayer.y - height / (2 * zoom) + myPlayer.size / 2;


  camX = lerp(camX, targetX, smoothSpeed);
  camY = lerp(camY, targetY, smoothSpeed);


  pushMatrix();
  scale(zoom);
  translate(-camX, -camY);
  connectRooms();
  drawDungeon();
  


  if (shootCooldown<0) {
    shootCooldown=0;
  } else {
    shootCooldown=shootCooldown-1;
  }

  if (shot==true) {
    screenShakeTimer=screenShakeTimer-1;
  }

  if (screenShakeTimer==0) {
    shot=false;
  }
  game();
  popMatrix();
}
