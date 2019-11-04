int N = width, M = height, R = 10, K = 100;
int X = N / R, Y = M / R;
boolean[][] exist = new boolean[X + 2][Y + 2];
color[][] pointColor = new color[X + 2][Y + 2];
int[][] move = {{1, -1}, {1, 0}, {1, 1}, {0, -1}, {0, 1}, {-1, 0}, {-1, 1}, {-1, -1}};
int moveIndex;
int COLOR_MODE = -1; //-1 = black, 1 = random
int speed;

void init() {
  speed = 0;
  moveIndex = 0;
  for(int i=0; i<=X+1; i++)
    for(int j=0; j<=Y+1; j++) {
      exist[i][j] = false;
      if (COLOR_MODE == -1)
        pointColor[i][j] = color(0);//color(random(256), random(256), random(256));
      else
        pointColor[i][j] = color(random(256), random(256), random(256));
    }
  for(int i=0; i<K; i++) {
      int x = 0, y = 0;
      do {
        x = (int)random(X);
        y = (int)random(Y);
      } while(exist[x+1][y+1]);
      exist[x+1][y+1] = true;
      for(int k=0; k<8; k++) {
        int value = (int)random(5);
        if (value == 0) exist[x+1+move[k][0]][y+1+move[k][1]] = true;
        else exist[x+1+move[k][0]][y+1+move[k][1]] = false;
      }
  }
}

void setValue(int i, int j, boolean v) {
  exist[(i + moveIndex) % Y][j] = v;
}

boolean getValue(int i, int j) {
  return exist[(i + moveIndex) % Y][j];
}

void setup() {
  fullScreen();
  N = width;
  M= height;
  X = N / R;
  Y = M / R;
  exist = new boolean[X + 2][Y + 2];
  pointColor = new color[X + 2][Y + 2];
  speed = 0;
  init();
}  
void draw() {
  background(255);
  for(int i=1; i<=X; i++)
    for(int j=1; j<=Y; j++)
      if (getValue(i, j)) {
        stroke(pointColor[i][j]);
        fill(pointColor[i][j]);
        ellipse((i - 0.5) * R, (j - 0.5) * R, R, R);
      }
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
    for(int j=1; j<=Y; j++) setValue(i, j, temp[i][j]);
  delay(speed);
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {
    noLoop();
  }
  if (key == 'W' || key == 'w') {
    speed = min(speed + 10, 1500);
  }
  if (key == 'D' || key == 'd') {
    speed = max(0, speed - 10);
  }
  if (key == 'R' || key == 'r') {
    init();
  }
  if (key == 'S' || key == 's') {
    COLOR_MODE *= -1;
    for(int i=0; i<=X+1; i++)
      for(int j=0; j<=Y+1; j++)
        if (COLOR_MODE == -1)
          pointColor[i][j] = color(0);
        else
          pointColor[i][j] = color(random(256), random(256), random(256));
  }
}
