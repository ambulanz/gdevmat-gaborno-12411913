Walker[] walkers = new Walker[10];

PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);
void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initWalkers();
}

void initWalkers() {
  for (int i = 0; i < walkers.length; i++) {
    float x = -500;
    float y = 200;
    walkers[i] = new Walker(x, y);
    
    walkers[i].scale = i * 15;
    walkers[i].mass = i;
  }
}

void draw() {
  background(80);
  

  for (Walker e : walkers) {
    e.render();
    e.update();
    e.applyForce(wind);
    e.applyForce(gravity);
    
    if (e.position.y <= Window.bottom || e.position.y >= Window.top)
    {
      e.velocity.y *= -1;
    }
    
    if (e.position.x >= Window.right || e.position.x <= Window.left)
    {
      e.velocity.x *= -1;
    }
  }
}
