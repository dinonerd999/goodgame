class lootCrate extends GameObject {
  lootCrate(float x, float y, int luck, float hp) {
    //determines chest x and y
    super(x, y, luck, hp);
  }
  void Open() {

    super.Open();
    if (opened) {
      imageMode(CENTER);
      //opening animation
      
      if (opening<100000)opening=opening+2;
      if (opening<=280) image(open3, x, y, 9, 8);
      if (opening>=280) {
        if (chance<=100.1) {
        }
        Rarities(chance, luck, x, y, PickUp);
      }
      if (opening<=280 && opening>=120) Rolling(x, y, luck);
      if (opening<=120) image(open2, x, y, 9, 8);
      if (opening<=60) image(open1, x, y, 9, 8);
    } else if (opened==false && open==false) {
      imageMode(CENTER);
      image(chest, x, y, 9, 8);
    }
    if (keyPressed && key=='e' && myPlayer.x>=x-uh && myPlayer.x<=x+cs+uh && myPlayer.y>=y-uh && myPlayer.y<=y+cs+uh) {
      //determines if chest has been opened
      opened=true;
      open=true;
      PickUp=false;
    }
  }
}


void drawChests() {
  int i = 0;
  if (i < 10) {
    for (Room r : rooms) {
      objects.add(new lootCrate(r.x+r.w/2, r.y+r.h/2, r.diff, 10));
    }
  }
  i=i+1;
}
void Rarities(float chance, float luck, float x, float y, boolean PickUp) {
  Legendary(chance, luck, x, y, PickUp);
  Exotic(chance, luck, x, y, PickUp);
  Rare(chance, luck, x, y, PickUp);
  Uncommon(chance, luck, x, y, PickUp);
  Common(chance, luck, x, y, PickUp);
}
void Common(float chance, float luck, float x, float y, boolean PickUp) {
  if (chance<=50-luck) {
    if (chance>=(50-luck)/2 && PickUp==false) {
      image(common, x, y, 4.5, 4.5);
      image(pistol, x, y, 4.5, 4.5);
    } else if (PickUp==false) {
      image(common, x, y, 4.5, 4.5);
      image(sks, x, y, 4.5, 4.5);
    }
  }
}
void Uncommon(float chance, float luck, float x, float y, boolean PickUp) {
  if (chance<=80-luck && chance>50-luck && PickUp==false) {
    image(uncommon, x, y, 4.5, 4.5);
    image(duel, x, y, 4.5, 4.5);
  }
}
void Rare(float chance, float luck, float x, float y, boolean PickUp) {
  if (chance<=95-luck && chance>80-luck && PickUp==false) {
    image(rare, x, y, 4.5f, 4.5f);
  }
}
void Exotic(float chance, float luck, float x, float y, boolean PickUp) {
  if (chance<=99.5-luck && chance>95-luck && PickUp==false) {
    image(exotic, x, y, 4.5f, 4.5f);
  }
}
void Legendary(float chance, float luck, float x, float y, boolean PickUp) {
  if (chance<=100 && luck>99.5 && PickUp==false) {
    image(legendary, x, y, 4.5f, 4.5f);
  }
}
float fakeChance=0;
void Rolling(float x, float y, float luck) {
  if (frameCount % 9 == 0) fakeChance=random(0, 100);
  if (fakeChance<=100-luck) image(legendary, x, y, 4.5f, 4.5f);
  if (fakeChance<=80-luck) image(exotic, x, y, 4.5f, 4.5f);
  if (fakeChance<=60-luck) image(rare, x, y, 4.5f, 4.5f);
  if (fakeChance<=20-luck) image(uncommon, x, y, 4.5f, 4.5f);
  if (fakeChance<=19-luck) image(common, x, y, 4.5f, 4.5f);
}
