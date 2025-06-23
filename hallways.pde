ArrayList<Hallway> hallways = new ArrayList<Hallway>();

class Hallway {
  float x, y, w, h, strokeWeight;

  Hallway(float x, float y, float w, float h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  
  Hallway(float x, float y, float w, float h, float strokeWeight) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.strokeWeight=strokeWeight;
  }
}

void drawHalls() {
  if (hallways.size()<100) {
    fill(80);
    stroke(crimson);
    strokeWeight(2);
    for (Hallway h : hallways) {
      rect(h.x, h.y, h.w, h.h);
    }
  }
}


void smallHalls() {
  
  fill(crimson2);
  stroke(255);
  noStroke();
  for (Hallway h : hallways) {
    rect(h.x, h.y, h.w, h.h);
  }
}
