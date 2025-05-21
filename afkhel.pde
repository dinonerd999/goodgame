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


void generateDungeon() {
  rooms.clear();

  int centerX = 1000;
  int centerY = 500;

  // Starting room size


  // Create and add the starting room
  startRoom = new Room(centerX - 40, centerY - 4, 80, 80);
  rooms.add(startRoom);




  for (int i = 1; i < numRooms; i++) {
    int rw = int(random(minSize, maxSize));
    int rh = int(random(minSize, maxSize));
    int rx = int(random(centerX - 800, centerX + 800));
    int ry = int(random(centerY - 400, centerY + 400));

    Room r = new Room(rx, ry, rw, rh);
    rooms.add(r);
  }
}








void drawDungeon() {
  //background(20);
  fill(80);
  stroke(255);

  for (Room room : rooms) {
    rect(room.x, room.y, room.w, room.h);
  }
}





class Room {
  int x, y, w, h;
  boolean[] doors = {false, false, false, false}; // top, right, bottom, left

  Room(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  boolean intersects(Room other) {
    return !(x + w <= other.x || x >= other.x + other.w ||
      y + h <= other.y || y >= other.y + other.h);
  }
}

void connectRooms() {
  for (int i = 1; i < rooms.size(); i++) {
    Room r1 = rooms.get(i - 1);
    Room r2 = rooms.get(i);

    int x1 = r1.x + r1.w / 2;
    int y1 = r1.y + r1.h / 2;
    int x2 = r2.x + r2.w / 2;
    int y2 = r2.y + r2.h / 2;

    stroke(100);
    noFill();
    line(x1, y1, x2, y1);
    line(x2, y1, x2, y2);
  }
}

boolean isInsideRoom(float x, float y) {
  for (Room room : rooms) {
    if (x<room.x + room.w && x>room.x && y<room.y + room.w && y>room.y) {
      return true;
    }
  }
  return false;
}
