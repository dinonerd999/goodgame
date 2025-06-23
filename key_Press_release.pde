void keyPressed() {
  if (key=='w') wKey=true;
  if (key=='a') aKey=true;
  if (key=='s') sKey=true;
  if (key=='d') dKey=true;
}


void keyReleased() {
  if (key=='w') wKey=false;
  if (key=='a') aKey=false;
  if (key=='s') sKey=false;
  if (key=='d') dKey=false;
}

int i;
void playerMove() {

  float nextX = myPlayer.x;
  float nextY = myPlayer.y;

  if (wKey==true) nextY -= velocity;
  if (sKey==true) nextY += velocity;
  if (aKey==true) nextX -= velocity;
  if (dKey==true) nextX += velocity;

  // Check if the new position is inside any room
  if (isInsideRoom(nextX, nextY)) {
    myPlayer.x=nextX;
    myPlayer.y=nextY;
  }
  
  for (Room r : rooms) {
    //if(isInsideRoom(nextX,nextY)&& isInsideHall(nextX, nextY)) r.active=false;
    if (isInsideRoom(nextX, nextY) && isInsideHall(nextX, nextY) && keyPressed && key=='p') r.active=true;
    else if (isInsideHall(nextX, nextY) && isInsideRoom(nextX, nextY)){
      r.active=false;
      
    }
    if (isInsideRoom(nextX, nextY)==false && r.active && isInsideHall(nextX, nextY)) {
      myPlayer.x=nextX;
      myPlayer.y=nextY;
    }
  }
}
