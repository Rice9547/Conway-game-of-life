void conway() {
  boolean[][] temp = new boolean[X+2][Y+2];
  for(int i=1; i<=X; i++)
    for(int j=1; j<=Y; j++) {
      int count = 0;
      for(int k=0; k<8; k++) {
        if (getValue(i + move[k][0], j + move[k][1])) {
          count++;
        }
      }
      temp[i][j] = getValue(i, j);
      if (getValue(i, j)) {
        if (count < 2 || count > 3) temp[i][j] = false;
      } else if (count == 3) temp[i][j] = true;
    }
  for(int i=1; i<=X; i++)
    for(int j=1; j<=Y; j++)
      exist[i][j] = temp[i][j];
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
      if (groupIndex[i][j] != -1) {
        temp[i + move[groupIndex[i][j]][0]][j + move[groupIndex[i][j]][1]] = true;
      }
    }
  }
  for(int i=1; i<=X; i++)
    for(int j=1; j<=Y; j++)
      exist[i][j] = temp[i][j];
}
