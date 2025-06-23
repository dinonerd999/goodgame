import java.util.ArrayList;
ArrayList<GameObject> objects;
boolean wKey, aKey, sKey, dKey;
float x, y;
int velocity;
float gameObject;
color blue=#0064C8, grey=#818181, tan=#A09D6A, brown=#4D352F, crimson=#46170b, crimson2=#2a0e07;
float shootCooldown;
boolean shot;
int screenShakeTimer;
float mx, my;
float rx, ry;
float rotatePlayer;
//boolean PISTOL, SKS, DUEL, HANDS;
int halls;
//float playerX = 1000;
//float playerY = 500;
int weaponHeld, NONE, PISTOL, SKS, DUEL;
Player myPlayer;
//////////////////////////////////////////////////////////////////////////
lootCrate Chest;
int run;
int luck;
float cs, uh;
PImage pistol, sks, duel;
PImage chest, open1, open2, open3;
PImage common, uncommon, rare, exotic, legendary, player;
PImage duelHold, run2, pistolHold, sksHold, run1;
//////////////////////////////////////////////////////////////////////////
float zoom = 5.0;
float camX = 0;
float camY = 0;
float smoothSpeed = 0.1;
int ha;
int enemysKilled;
//boolean done;
/////?//////////////////////////////////////////////
void setup() {

  weaponHeld=NONE;
  NONE=0;
  PISTOL=1;
  SKS=2;
  DUEL=3;
  //HANDS=true;
  myPlayer= new Player();
  size(2000, 1000);
  velocity=1;
  x=1000;
  y=500;
  objects = new ArrayList<GameObject>();
  objects.add(myPlayer);
  shot=false;
  generateDungeon();
  strokeWeight(1);
  //fullScreen();
  cs=32;
  uh=8;
  IMAGES();
  luck=0;
  ////////////////////////////////////////////////////////////////////////////
  drawChests();
}


void draw() {

  playerMove();
  background(0);
  weaponHeld=DUEL;


  float targetX = myPlayer.x - width / (2 * zoom) + myPlayer.size / 2;
  float targetY = myPlayer.y - height / (2 * zoom) + myPlayer.size / 2;


  camX = lerp(camX, targetX, smoothSpeed);
  camY = lerp(camY, targetY, smoothSpeed);


  pushMatrix();
  scale(zoom);
  mx=(mouseX/5)+camX;
  my=(mouseY/5)+camY;
  translate(-camX, -camY);
  connectRooms();


  drawDungeon();
  if (shootCooldown<=0) {
    shootCooldown=0;
  } else {
    if (weaponHeld==PISTOL)shootCooldown=shootCooldown-1;
    if (weaponHeld==SKS) shootCooldown=shootCooldown-2;
    if (weaponHeld==DUEL) shootCooldown=shootCooldown-2;
  }
  //if (shot==true) {
  //  screenShakeTimer=screenShakeTimer-1;
  //}

  if (screenShakeTimer==0) {
    shot=false;
  }
  game();
  //drawDungeon();
  float angle=atan2(my-myPlayer.y, mx-myPlayer.x);
  pushMatrix();
  if (myPlayer.hp>0) {
    imageMode(CENTER);
    translate(myPlayer.x, myPlayer.y);
    rotate(angle);
    if (keyPressed) {
      if (weaponHeld==NONE) {
        if (run>30) image(run1, 1, 0, 8, 8);
        if (run<30) image(run2, 1, 0, 8, 8);
        if (run>=60) run=0;
        else run++;
      }
      if (weaponHeld==PISTOL) image(pistolHold, 1, 0, 8, 8);
      if (weaponHeld==SKS) image(sksHold, 1, 0, 8, 8);
      if (weaponHeld==DUEL) image(duelHold, 1, 0, 8, 8);
    } else {
      if (weaponHeld==NONE) image(run2, 1, 0, 8, 8);
      if (weaponHeld==PISTOL) image(pistolHold, 1, 0, 8, 8);
      if (weaponHeld==DUEL) image(duelHold, 1, 0, 8, 8);
      if (weaponHeld==SKS) image(sksHold, 2, 0, 8, 8);
    }
    image(player, 0, 0, 6, 6);
    popMatrix();
  }
  weapon();
  popMatrix();
}
