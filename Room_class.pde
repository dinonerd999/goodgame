class Room {
  float x, y, w, h;

  Room(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void draw() {
    fill(80);
    rect(x, y, w, h);
  }

  PVector center() {
    return new PVector(x + w / 2, y + h / 2);
  }

  boolean intersects(Room other) {
    return !(x + w < other.x || x > other.x + other.w || 
             y + h < other.y || y > other.y + other.h);
  }
}
