void generateDungeon() {
  rooms.clear();

  // --- 1. Define a world center (any big value works if you're not using tiles)
  int worldCenterX = 5000;
  int worldCenterY = 5000;

  // --- 2. Create the starting room in the center
  float startW = random(80, 120);
  float startH = random(80, 120);
  startRoom = new Room(worldCenterX - startW / 2, worldCenterY - startH / 2, startW, startH);
  rooms.add(startRoom);

  // --- 3. Generate additional rooms near the starting room
  int maxTries = 1000;
  int tries = 0;

  while (rooms.size() < numRooms && tries < maxTries) {
    tries++;

    // Random size
    float w = random(60, 120);
    float h = random(60, 120);

    // Random position near a random existing room
    Room base = rooms.get((int)random(rooms.size()));
    float x = base.x + random(-300, 300);
    float y = base.y + random(-300, 300);
    Room newRoom = new Room(x, y, w, h);

    // --- 4. Check for overlap
    boolean overlaps = false;
    for (Room r : rooms) {
      if (newRoom.intersects(r)) {
        overlaps = true;
        break;
      }
    }

    // --- 5. If no overlap, add the room
    if (!overlaps) {
      rooms.add(newRoom);
    }
  }
}
