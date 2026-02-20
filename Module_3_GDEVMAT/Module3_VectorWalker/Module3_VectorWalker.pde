void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();
PVector ballPosition = new PVector();
PVector ballSpeed = new PVector(5, 8);
PVector position = new PVector();
PVector speed = new PVector(1, 1);  
  
void draw()
{
  myWalker.randomWalk();
  myWalker.render();
  moveAndBounce();
}

void moveAndBounce()
{
  ballPosition.add(ballSpeed);
  
  ballPosition.x += ballSpeed.x;
  ballPosition.y += ballSpeed.y;
  
  if ((ballPosition.x > Window.right) || (ballPosition.x < Window.left))
  {
   ballSpeed.x *= -1; 
  }
  
  if ((ballPosition.y > Window.right) || (ballPosition.y < Window.left))
  {
   ballSpeed.y *= -1; 
  }
  
  fill(182, 52, 100);
  circle(ballPosition.x, ballPosition.y, 50);
}
