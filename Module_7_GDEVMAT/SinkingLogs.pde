Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
PVector wind = new PVector(0.1, 0);

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initWalkers();
}

void mousePressed() {
  initWalkers();
}

void initWalkers() {
  for (int i = 0; i < walkers.length; i++) {
    float x = 2 * (Window.windowWidth / 10) * (i - 5);
    float y = 200;
    walkers[i] = new Walker(x, y);
    
    walkers[i].scale = i * 15;
    walkers[i].mass = i + 1;
  }
}

void draw() {
  background(80);
  
  ocean.render();
  for (Walker e : walkers) {
    PVector gravity = new PVector(0, -0.15 * e.mass);
    float mew = 0.1f;
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = e.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    e.applyForce(friction);
     
    e.applyForce(gravity);
    e.applyForce(wind);
    
    e.render();
    e.update();
    
    if (ocean.isCollidingWith(e))
    {
      PVector dragForce = ocean.calculateDragForce(e);
      e.applyForce(dragForce);
    }
    
    if (e.position.x >= Window.right)
    {
       e.position.x = Window.right;
       e.position.x *= 1;
    }
    
    if (e.position.y <= Window.bottom)
    {
       e.position.y = Window.bottom;
       e.velocity.y *= -1;
    }
    
  }
}
