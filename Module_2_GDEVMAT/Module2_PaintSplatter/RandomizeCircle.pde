class RandomizeCircle
{
 color finalRandomizedColor; 
 float x;
 float y;
 float scale;
 
  void render()
  {
   randomizeColor();
   randomPos();
   randomScale();
   fill(finalRandomizedColor);
   noStroke();
   circle(x, y, scale); 
  }

 void randomizeColor()
 {
 int randomAlpha = int(random(10, 101));
 finalRandomizedColor = color(int(random(256)), int(random(256)), int(random(256)), randomAlpha);
 }
 
 void randomPos()
 {
  float gaussian = randomGaussian();

  float standardDeviation = 500;
  float mean = 0;
  
  x = standardDeviation * gaussian + mean;
  y = random(-720, 720);
 }
 
 void randomScale()
 {
  float gaussian = randomGaussian();

  float standardDeviation = 35;
  float mean = 10;
  
  scale = standardDeviation * gaussian + mean;
 }
 
}
