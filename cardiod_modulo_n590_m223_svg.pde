// https://processing.org/reference/libraries/svg/index.html
// cardiod_modulo_n1667_m154
// September 1 2020 COVIE-19 Stage 3 restrictions
// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm...
/* 
 There are 2 * PI Radians in a circle
 If we have a circle of radius 20 with its center at the origin, the circle can be described by the pair of equations
 x = 20 cos(t) 
 y = 20 sin(t)
 also pased on https://www.youtube.com/watch?v=qhbuKbxJsk8&amp... 
 Times Tables, Mandelbrot and the Heart of Mathematics
 by Burkard Polster and Giuseppe Geracitano
 see: http://codepen.io/hippiefuturist/full/NAvqgk/
 
 Artwork on Redbubble at: https://www.redbubble.com/shop/ap/24619400
 Code on Github at: https://github.com/rupertrussell/cardiod_modulo_n_455_500
 m=171 n=544
 m=154 n=1677
 m=613 n=696
 m=225 n=449
 m=223 n=590
 
 */
import processing.svg.*;

float scale = 1; 
float w = 1000 * scale ; // width of image
float h = 1000 * scale; // height of image
float m = 223; // Modulus/Points
float n = 590; // Multiplication Factor

void setup() {
  background(255); 
  size(1000, 1000); // full scale for Redbubble
  smooth();
  noLoop();
  beginRecord(SVG, "cardio m = " + m + "n = " + n+ ".svg");
}
void draw() {
  stroke(0);
  strokeWeight(2 * scale);
  float radius = w / 2 - 100;
  cardioid(n, radius); // number of points on circle, radius of circle
  // draw the cardiod lines
  for (int i = 0; i < n; i = i+1) {
    connectPoints(n, radius, i, i * m);
  }


  // draw the outline circle
  noFill();
  endRecord();
 // exit();
}
void cardioid(float n, float r) {
  // draws n points on a circle
  double step = 2 * PI/n; 
  float offset = w / 2;

}
void connectPoints(float n, float r, float firstPoint, float secondPoint) {
  // Connect two points on a circle
  float step = 2 * PI/n; 
  float offset = w / 2;
  // draw n points on circle
  float x1 = offset + r * cos(firstPoint * step);
  float y1 = offset - r * sin(firstPoint * step);
  float x2 = offset + r * cos(secondPoint * step);
  float y2 = offset -r * sin(secondPoint * step);

  line(x1, y1, x2, y2);
}
