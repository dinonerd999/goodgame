void connectRooms() {
  stroke(180);
  strokeWeight(8);
  noFill();

  for (int i = 1; i < rooms.size(); i++) {
    PVector a = rooms.get(i - 1).center();
    PVector b = rooms.get(i).center();

    // L-shaped corridor
    line(a.x, a.y, b.x, a.y);
    line(b.x, a.y, b.x, b.y);
  }
}
