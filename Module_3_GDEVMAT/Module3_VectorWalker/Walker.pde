class Walker
{
 PVector position = new PVector(0, 0);
 PVector speed = new PVector(2, 2);
 float x;
 float y;
 color finalRandomizedColor;
   
   void render()
  {
   fill(finalRandomizedColor);
   noStroke();
   circle(position.x, position.y, 30); 
  }
   
   void randomWalk()
   {
   randomizeColor();
   position.add(speed);
   int rng = int(random(5));
   
   if (rng == 0)
   {
    speed.y *= 1;
   }
   else if (rng == 1)
   {
    speed.y *= -1;
   }
   else if (rng == 2)
   {
    speed.x *= 1;
   }
   else if (rng == 3)
   {
    speed.x *= -1;
   }
   
   }
   
   void randomizeColor()
   {
   int randomAlpha = int(random(50, 101));
   finalRandomizedColor = color(int(random(256)), int(random(256)), int(random(256)), randomAlpha);
   }
   
    
  

   
}
