void weapon() {

  for (GameObject obj : objects) {
    if (obj instanceof lootCrate) {
      lootCrate crate = (lootCrate)obj;
      if (dist(myPlayer.x, myPlayer.y, crate.x, crate.y)<5 && keyPressed && key=='e' && crate.opening>=310) {
        if (crate.chance<=50-luck) {
          image(common, x, y, 4.5f, 4.5f);
          println(crate.chance,luck);
          if (crate.chance>=(50-luck)/2) {
            crate.PickUp=true;
            weaponHeld=PISTOL;
          } else {
            crate.PickUp=true;
            weaponHeld=SKS;
          }
        }
        if (crate.chance<=80-luck && crate.chance>50-luck) {
          crate.PickUp=true;
          weaponHeld=DUEL;
        }
      }
    }
  }
}
