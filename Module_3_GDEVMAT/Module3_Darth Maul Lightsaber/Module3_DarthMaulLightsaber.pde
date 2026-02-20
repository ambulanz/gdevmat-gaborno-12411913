void setup()
{

  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
float x = mouseX - Window.windowWidth / 2;
float y = -(mouseY - Window.windowHeight / 2);
return new PVector(x, y);
}

  
void draw()
{
  PVector mainGlow = mousePos();
  PVector bottomGlow = mousePos();
  PVector hiltTop = mousePos();
  PVector hiltBot = mousePos();
  PVector centerTop = mousePos();
  PVector centerBot = mousePos();
  
  
  background(130);
  
  
  strokeWeight(10);
  stroke(255, 0, 0);
 
  mainGlow.normalize().mult(300);
  line(0, 0, mainGlow.x, mainGlow.y);
  
  bottomGlow.normalize().mult(300);
  line(0, 0, -bottomGlow.x, -bottomGlow.y);
  
  
  
  strokeWeight(5);
  stroke(255);
  
  centerTop.normalize().mult(295);
  line(0, 0, centerTop.x, centerTop.y);
  
  centerBot.normalize().mult(295);
  line(0, 0, -centerBot.x, -centerBot.y);
  
  
  
  strokeWeight(17);
  stroke(0);
  
  hiltTop.normalize().mult(50);
  line(0, 0, hiltTop.x, hiltTop.y);
  
  hiltBot.normalize().mult(50);
  line(0, 0, -hiltBot.x, -hiltBot.y);
  
 
  
  println(mainGlow.mag());
}
