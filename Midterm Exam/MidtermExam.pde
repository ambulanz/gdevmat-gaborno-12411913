Walker[] walkers = new Walker[100];
BlackHole blackHole = new BlackHole();

int frameLimit = 300;

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

void draw() {
  background(0);

  if (frameCount % frameLimit == 0) {
    initWalkers();
  }

  blackHole.render();
  for (Walker e : walkers) {
    PVector direction = PVector.sub(blackHole.position, e.position);
    
    float distance = direction.mag();
    direction.normalize();
    
    float gravitationalPull = 200.0 / (distance + 1);
    direction.mult(gravitationalPull);
    
    e.velocity.add(direction);
    e.velocity.limit(10);
    e.position.add(e.velocity);
    
    e.render();
  }
}
