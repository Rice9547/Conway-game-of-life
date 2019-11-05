void conway() {
  boolean[][] temp = new boolean[X+2][Y+2];
  for(int i=1; i<=X; i++)
    for(int j=1; j<=Y; j++) {
      int count = 0;
      for(int k=0; k<8; k++) {
        if (points[i + move[k][0]][j + move[k][1]].exist) {
          count++;
        }
      }
      temp[i][j] = points[i][j].exist;
      if (points[i][j].exist) {
        if (count < 2 || count > 3) temp[i][j] = false;
      } else if (count == 3) temp[i][j] = true;
    }
  for(int i=1; i<=X; i++)
    for(int j=1; j<=Y; j++)
      points[i][j].exist = temp[i][j];
}

void pointMove() {
  checkGroup();
  boolean[][] temp = new boolean[X+2][Y+2];
  for(int i=0; i<=X+1; i++) {
    for(int j=0; j<=Y+1; j++) {
      temp[i][j] = false;
    }
  }
  for(int i=1; i<=X; i++) {
    for(int j=1; j<=Y; j++) {
      if (points[i][j].exist && points[i][j].group != -1) {
        temp[i + move[points[i][j].group][0]][j + move[points[i][j].group][1]] = true;
      }
    }
  }
  for(int i=1; i<=X; i++)
    for(int j=1; j<=Y; j++)
      points[i][j].exist = temp[i][j];
}
