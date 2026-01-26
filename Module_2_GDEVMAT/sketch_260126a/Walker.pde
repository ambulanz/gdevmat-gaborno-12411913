class Walker
{
 float x;
 float y;
 color finalRandomizedColor;
   
    void render()
  {
   fill(finalRandomizedColor);
   noStroke();
   circle(x, y, 30); 
  }
   
   void randomWalk()
   {
    
    randomizeColor();
     
   int rng = int(random(8));
   int cardinalSpeed = 10;
   int ordinalSpeed = 5;
   
   // CARDINAL DIRECTIONS
   if (rng == 0)
   {
    y += cardinalSpeed; 
   }
   else if (rng == 1)
   {
    y -= cardinalSpeed;
   }
   else if (rng == 2)
   {
    x += cardinalSpeed;
   }
   else if (rng == 3)
   {
    x -= cardinalSpeed;
   }
   
   // ORDINAL DIRECTIONS
   if (rng == 4)
   {
     y += ordinalSpeed;
     x += ordinalSpeed;
   }
   else if (rng == 5)
   {
     y += ordinalSpeed;
     x -= ordinalSpeed;
   }
   else if (rng == 6)
   {
     y -= ordinalSpeed;
     x += ordinalSpeed;
   }
    else if (rng == 7)
   {
     y -= ordinalSpeed;
     x -= ordinalSpeed;
   }
   
   }
   
   void randomWalkBiased()
   {
   randomizeColor();
   int riggedRng = int(random(11));
   int riggedNo = 7;
   int walkerSpeed = 10;
   
   if (riggedRng <= riggedNo)
   {
     x += walkerSpeed;
   }
   else if (riggedRng == 8)
   {
     x -= walkerSpeed;
   }
   else if (riggedRng == 9)
   {
     y += walkerSpeed;
   }
   else if (riggedRng == 10)
   {
     y -= walkerSpeed;
   }
   
   }
   
   void randomizeColor()
   {
   int randomAlpha = int(random(50, 101));
   finalRandomizedColor = color(int(random(256)), int(random(256)), int(random(256)), randomAlpha);
   }
   
    
  

   
}
