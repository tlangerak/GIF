/* This is a GIF maker for my IACD course at CMU.
For this I have made use of the setGradient example
by processing */



int n = 0;

color c1;
color c2;

int x;
int y;
int z;

int x2=0;
int y2=0;
int z2=0;

int Y_AXIS = 1;
int X_AXIS = 2;
int i;

void setup() {
  size(1500, 1500);
  frameRate(10);
}

void draw() {
  x= int(pow(sin(PI/10*(n+3)),2)*255);
  y= int(pow(sin(PI/10*(n-2)),2)*255);
  z= int(pow(sin(PI/10*n),2)*255);
  println(x);

  c1=color(x, y, z);
  c2=color(x2, y2, z2);
  setGradient(0, 0,width, height, c1, c2, Y_AXIS);
   
  x2=x;
  y2=y;
  z2=z;
  
  n++;
  saveFrame("line-######.png");
  if (n>9) {
    n=0;
  }
}



void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

