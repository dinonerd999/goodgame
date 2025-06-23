ArrayList<Room> rooms = new ArrayList<Room>();


Room startRoom;
int maxRooms = 29;
int minSize = 70;
int maxSize = 150;



final int GRID_WIDTH = 10;
final int GRID_HEIGHT = 10;
Room[][] dungeon = new Room[GRID_WIDTH][GRID_HEIGHT];

ArrayList<Room> generatedRooms = new ArrayList<Room>();
int numRooms = 25;  // How many rooms you want in the dungeon


void generateDungeon() {
  rooms.clear();
  hallways.clear();

  int centerX = 1000;
  int centerY = 500;

  // Create and add the starting room
  startRoom = new Room(centerX - 40, centerY - 40, 80, 80, 0, false, false);
  rooms.add(startRoom);

  int attempts = 0;
  int maxAttempts = 500;

  while (rooms.size() < numRooms && attempts < maxAttempts) {
    attempts++;

    int rw = int(random(minSize, maxSize));
    int rh = int(random(minSize, maxSize));
    int rx = int(random(centerX - 800, centerX + 800));
    int ry = int(random(centerY - 400, centerY + 400));


    Room newRoom = new Room(rx, ry, rw, rh, rooms.size(), false, false);
    //Room newRoom=rooms.add(new Room(rx, ry,rw,rh,rooms.size(), false, false));
    boolean overlaps = false;

    for (Room r : rooms) {
      if (newRoom.intersects(r)) {
        overlaps = true;
        break;
      }
    }

    if (!overlaps) {
      rooms.add(newRoom);
    }
  }

  println("Generated " + rooms.size() + " rooms in " + attempts + " attempts.");

  // Set difficulty based on distance from the start room
  Room start = rooms.get(0);  // startRoom also points to this
  float maxDist = 0;

  // First, find the maximum distance from the start room
  for (Room r : rooms) {
    float dx = (r.x + r.w / 2) - (start.x + start.w / 2);
    float dy = (r.y + r.h / 2) - (start.y + start.h / 2);
    float dist = sqrt(dx * dx + dy * dy);
    if (dist > maxDist) maxDist = dist;
  }

  // Then, assign difficulty based on normalized distance
  for (Room r : rooms) {
    float dx = (r.x + r.w / 2) - (start.x + start.w / 2);
    float dy = (r.y + r.h / 2) - (start.y + start.h / 2);
    float dist = sqrt(dx * dx + dy * dy);

    // Map distance to integer difficulty from 1 to 10
    r.diff = int(map(dist, 0, maxDist, 1, 10));
  }
}


void drawDungeon() {
  drawHalls();
}





class Room {
  float x, y, w, h;
  int diff;

  boolean[] doors = {false, false, false, false}; // top, right, bottom, left
  boolean active, done;
  Room(int x, int y, int w, int h, int diff, boolean active, boolean done) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.diff = diff;
    this.active=active;
    this.done=done;
  }

    int i=0;
  void eh() {
    
    strokeWeight(2);
    fill(crimson2);
    stroke(crimson);
    rect(x, y, w, h);
    textSize(5);
    if (done==false && myPlayer.x >= x && myPlayer.x <= x + w && myPlayer.y >= y && myPlayer.y <= y + h) {
    
      while (i<pow(diff, 2)) {
        objects.add( new badGuys(random(x, x+w), random(y, y+h), 5, 2, blue, 60));
        i++;
        println(pow(diff, 2));
      }
    }
  }
  boolean intersects(Room other) {
    return !(x + w <= other.x || x >= other.x + other.w || y + h <= other.y || y >= other.y + other.h);
  }
}

void connectRooms() {
  hallways.clear();  // always clear before generating

  for (int i = 1; i < rooms.size(); i++) {
    Room r1 = rooms.get(i - 1);
    Room r2 = rooms.get(i);

    float x1 = r1.x + r1.w / 2;
    float y1 = r1.y + r1.h / 2;
    float x2 = r2.x + r2.w / 2;
    float y2 = r2.y + r2.h / 2;

    int thickness = 8;

    // Horizontal hallway (centered vertically)
    float hX = min(x1, x2)-4;
    float hY = y1 - (thickness / 2)+4;
    float hW = abs(x2 - x1)+4;
    float hH = thickness;

    if (hW > 0) {
      hallways.add(new Hallway(hX, hY, hW, hH));
      noStroke();
      hallways.add(new Hallway(hX+1, hY+1, hW-1, hH-1));
      strokeWeight(1);
    }

    // Vertical hallway (centered horizontally)
    float vX = x2 - thickness / 2;
    float vY = min(y1, y2);
    int vW = thickness;
    float vH = abs(y2 - y1);

    if (vH > 0) {
      hallways.add(new Hallway(vX, vY, vW, vH));
      noStroke();
      fill(255, 0, 0);
      hallways.add(new Hallway(vX+1, vY+1, vW-1, vH-1));
      strokeWeight(1);
    }
  }
}




boolean isInsideRoom(float x, float y) {

  for (Room r : rooms) {
    if (x >= r.x && x <= r.x + r.w && y >= r.y && y <= r.y + r.h) {

      return true;
    }


    //for (Hallway h : hallways) {
    //  if (x >= h.x && x <= h.x + h.w && y >= h.y && y <= h.y + h.h) {
    //    return true;
    //  }
    //}
  }

  return false;
}

boolean badIsInsideRoom(float x, float y) {

  for (Room r : rooms) {
    if (x >= r.x && x <= r.x + r.w && y >= r.y && y <= r.y + r.h) {

      return true;
    }


    //for (Hallway h : hallways) {
    //  if (x >= h.x && x <= h.x + h.w && y >= h.y && y <= h.y + h.h) {
    //    return true;
    //  }
    //}
  }

  return false;
}



boolean cantLeave(float x, float y) {

  for (Room r : rooms) {
    if (x >= r.x && x <= r.x + r.w && y >= r.y && y <= r.y + r.h && r.active==false) {

      return true;
    }
  }

  return false;
}



boolean isInsideHall(float x, float y) {
  for (Hallway h : hallways) {
    if (x >= h.x && x <= h.x + h.w &&
      y >= h.y && y <= h.y + h.h) {
      return true;
    }
  }

  return false;
}
