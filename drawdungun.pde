
void drawDungeon() {
  //background(20);
  fill(80);
  stroke(255);

  for (Room room : rooms) {
    fill(tan);
    stroke(grey);
    strokeWeight(5);
    rect(room.x, room.y, room.w, room.h);
    noStroke();
    
  }
}
