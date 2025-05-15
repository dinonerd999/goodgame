void game() {
  if (shot==true) {
    pushMatrix();
    translate(random(-5, 5), random(-5, 5));
    
    
    int i = 0;

    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      obj.show();
      obj.act();
      if (obj.isDead()) {
        objects.remove(i);
      } else {
        i++;
      }
    }
    
    popMatrix();
  } else {
    
    
    int i = 0;

    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      obj.show();
      obj.act();
      if (obj.isDead()) {
        objects.remove(i);
      } else {
        i++;
      }
    }
  }
}
