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
Player myPlayer;





ArrayList<Room> rooms = new ArrayList<Room>();
Room startRoom;

int maxRooms = 29;
int minSize = 40;
int maxSize = 100;



final int GRID_WIDTH = 10;
final int GRID_HEIGHT = 10;
Room[][] dungeon = new Room[GRID_WIDTH][GRID_HEIGHT];

ArrayList<Room> generatedRooms = new ArrayList<Room>();
int numRooms = 15;  // How many rooms you want in the dungeon

float zoom = 5.0;     // 2x zoom
float camX = 0;       // Camera X offset
float camY = 0;       // Camera Y offset
float smoothSpeed = 0.1; // Smoothing factor (0 = instant, 1 = never)

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
  background(0);
  float targetX = myPlayer.x - width / (2 * zoom) + myPlayer.size / 2;
  float targetY = myPlayer.y - height / (2 * zoom) + myPlayer.size / 2;

  // Smooth camera movement (lerp = linear interpolate)
  camX = lerp(camX, targetX, smoothSpeed);
  camY = lerp(camY, targetY, smoothSpeed);

  // Camera and zoom
  pushMatrix();
  scale(zoom);
  translate(-camX, -camY);



  println(objects.size());

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
  connectRooms();   // Draw corridors first
  for (Room r : rooms) {
    r.draw();       // Draw rooms on top
  }

  popMatrix();
}
