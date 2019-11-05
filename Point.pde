class Point {
  boolean exist;
  color _color;
  int group;
  
  Point() {
    exist = false;
    _color = color(random(255), random(255), random(255));
    group = -1;
  }
};
