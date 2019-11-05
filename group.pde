void checkGroup() {
  for(int i=0; i<=X+1; i++) {
    for(int j=0; j<=Y+1; j++) points[i][j].group = -1;
  }
  for(int i=1; i<=X; i++) {
    for(int j=1; j<=Y; j++) {
      if (points[i][j].exist && points[i][j].group == -1) {
        int r = 2, k = 0;
        int[][] arr = {{1, 2, 6}, {1, 3, 7}, {0, 2, 4}, {0, 3, 5}};
        if (i * 2 <= X) {
          if (j * 2 > Y) k = arr[0][r];
          else k = arr[1][r];
        } else {
          if (j * 2 > Y) k = arr[2][r];
          else k = arr[3][r];
        }
        assignGroup(i, j, k);
      }
    }
  }
}

void assignGroup(int i, int j, int id) {
  points[i][j].group = id;
  for(int k=0; k<8; k++) {
    int x = i + move[k][0], y = j + move[k][1];
    if (points[x][y].exist && points[i][j].group == -1) {
      assignGroup(x, y, id);
    }
  }
}
