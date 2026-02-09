class Walker
{
 public float x;
 public float y;
 public float tx = 0, ty = 10000;
 
 public float scale;
 public float s = 0;
 
 public color randColor;
 
 public float red;
 public float r = 0;
 
 public float green;
 public float g = 10000;
 
 public float blue;
 public float b = 20000;
  
  void render()
  {
   randomizeCircle();
   fill (randColor);
   circle(x, y, scale);
   /*
   fill(finalRandomizedColor);
   noStroke();
   circle(x, y, 30);
   */
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360); 
    
    tx += 0.01f;
    ty += 0.01f;
  }
   
  void randomizeCircle()
  {
   
  scale = map(noise(s), 0, 1, 5, 150);
  s += 0.01f;
  
  red = map(noise(r), 0, 1, 0, 255);
  green = map(noise(g), 0, 1, 0, 255);
  blue = map(noise(b), 0, 1, 0, 255);
  
  r += 0.05f;
  g += 0.05f;
  b += 0.05f;
  
  randColor = color(red, green, blue, 255);
  }
   
}
