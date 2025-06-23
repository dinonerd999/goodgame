void game() {
  
  if (shot==true) {
    pushMatrix();
    //translate(random(-2, 2), random(-2, 2));
    
    
    int i = 0;
    int g = 0;
    
    while (g < rooms.size()) {
      Room r = rooms.get(g);
      r.eh();
      g++;
      
      
    }
    smallHalls();
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      obj.show();
      obj.act();
      obj.Open();
      obj.B();
      obj.BadAct();
      obj.pew();
      if (obj.isDead()) {
        objects.remove(i);
      } else {
        i++;
      }
    }
    
    
    
    popMatrix();
  } else {
    int g = 0;
    while (g < rooms.size()) {
      Room r = rooms.get(g);
      r.eh();
      g++;
      
    }
    int i = 0;
    smallHalls();
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      obj.show();
      obj.act();
      obj.Open();
      obj.BadAct();
      obj.pew();
      if (obj.isDead()) {
        objects.remove(i);
      } else {
        i++;
      }
    }
    
    
    
    
  }
}
