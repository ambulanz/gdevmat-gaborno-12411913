Walker[] walkers = new Walker[100];
BlackHole blackHole = new BlackHole();

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initWalkers();
}

void initWalkers() {
  blackHole = new BlackHole();
  for (int i = 0; i < walkers.length; i++) {
    float x = randomGaussian() * Window.windowWidth * 0.4;
    float y = randomGaussian() * Window.windowHeight * 0.4;
    walkers[i] = new Walker(x, y);
  }
}

PVector mousePos()
{
float x = mouseX - Window.windowWidth;
float y = -(mouseY - Window.windowHeight);
return new PVector(x, y);
}

void draw() {
  background(0);
  
  blackHole.position = mousePos();
  blackHole.render();
  
  for (Walker e : walkers) {
    PVector direction = PVector.sub(blackHole.position, e.position);
    
    direction.normalize();
    
    float gravitationalPull = 0.2;
    direction.mult(gravitationalPull);
    
    e.velocity.add(direction);
    e.velocity.limit(10);
    e.position.add(e.velocity);
    
    e.render();
  }
}
