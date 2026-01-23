void setup()
{
size(1280, 720, P3D);
camera (0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0 ,0, 0, -1, 0);
}

void draw()
{
background(0);
drawCartesianPlane();
drawYellowColor();
drawPurpleColor();
drawRedColor();

}

void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i+= 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawYellowColor()
{
  // f(x) = x^2 - 15x - 3
  color yellow = color (255, 251, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, (float)Math.pow(x, 2) - (15 * x) - 3, 5);
  }
}

void drawPurpleColor()
{
  // f(x) = -5x + 30
  color purple = color (135, 0, 255);
  fill(purple);
  stroke(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  { 
  circle(x, (-5 * x) + 30, 5); 
  }
}

void drawRedColor() {
  color red = color (255, 0, 0);
  stroke(red);
  noFill();

  float scale = 10;
  float amplitude = 10;

  beginShape();
  for (float x = -30; x <= 30; x += 0.1) {
    float y = amplitude * sin(x);
    vertex(x * scale, -y * scale);
  }
  endShape();
}
