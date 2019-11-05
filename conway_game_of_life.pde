int N = width, M = height, R = 10, K = 1000;
int X = N / R, Y = M / R;
Point[][] points;
int[][] move = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}, {-1, -1}, {-1, 1}, {1, -1}, {1, 1}};
int COLOR_MODE = -1; //-1 = black, 1 = random
int speed;

void init() {
  points = new Point[X+2][Y+2];
  for(int i=0; i<=X+1; i++)
    for(int j=0; j<=Y+1; j++) points[i][j] = new Point();
  for(int i=0; i<K; i++) {
      int x = 0, y = 0;
      do {
        x = (int)random(X);
        y = (int)random(Y);
      } while(points[x+1][y+1].exist);
      points[x+1][y+1].exist = true;
      for(int k=0; k<8; k++) {
        int value = (int)random(5), _x = x + 1 + move[k][0], _y = y + 1 + move[k][1];
        if (_x == 0 || _y == 0 || _x == X || _y == Y) continue;
        if (value == 0) points[_x][_y].exist = true;
        else points[_x][_y].exist = false;
      }
  }
}

void setup() {
  fullScreen();
  N = width;
  M= height;
  X = N / R;
  Y = M / R;
  speed = 0;
  init();
}

boolean run = true;
void draw() {
  background(255);
  for(int i=1; i<=X; i++)
    for(int j=1; j<=Y; j++)
      if (points[i][j].exist) {
        stroke(COLOR_MODE == -1 ? color(0) : points[i][j]._color);
        fill(COLOR_MODE == -1 ? color(0) : points[i][j]._color);
        ellipse((i - 0.5) * R, (j - 0.5) * R, R, R);
      }
  if (run) {
    conway();
  } else {
    pointMove();
  }
  run = !run;
  delay(100);
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
  }
}
