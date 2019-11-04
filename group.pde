int[][] groupIndex = new int[X+2][Y+2];
int groupLength = 0;

void checkGroup() {
  for(int i=0; i<=X+1; i++) {
    for(int j=0; j<=Y+1; j++) groupIndex[i][j] = -1;
  }
  for(int i=1; i<=X; i++) {
    for(int j=1; j<=Y; j++) {
      if (exist[i][j] && groupIndex[i][j] == -1) {
        int k = 0;
        if (i * 2 <= X) {
        } else {
          
          k = 7;
        }
        assignGroup(i, j, k);
        groupLength++;
      }
    }
  }
}

void assignGroup(int i, int j, int id) {
  if (i == 0 || j == 0 || i == X + 1 || j == Y + 1) return;
  groupIndex[i][j] = id;
  for(int k=0; k<8; k++) {
    int x = i + move[k][0], y = j + move[k][1];
    if (exist[x][y] && groupIndex[x][y] == -1) {
      assignGroup(x, y, id);
    }
  }
}
