Walker[] walkers = new Walker[8];

PVector acceleration = new PVector(0.2, 0);
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
    float x = -500;
    float y = -2 * (Window.windowHeight / 10) * (i - 5);
    walkers[i] = new Walker(x, y);
    
    walkers[i].scale = i * 15;
    walkers[i].mass = i + 1;
  }
}

void draw() {
  background(80);
  
  stroke(255);
  line(0, Window.top, 0, Window.bottom);

  for (Walker e : walkers) {
    float mew;
    if (e.position.x >= 0)
    {
       mew = 0.4;
    }
    else { mew = 0.01f; }
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = e.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    e.applyForce(friction);
     
    e.applyForce(acceleration);
    
    e.render();
    e.update();
    
    if (e.position.x >= Window.right)
    {
       e.position.x = Window.right;
       e.position.x *= -1;
    }
    
    if (e.position.y <= Window.bottom)
    {
       e.position.y = Window.bottom;
       e.velocity.y *= -1;
    }
    
  }
}
