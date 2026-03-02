Walker[] walkers = new Walker[10];

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
    float x = randomGaussian() * Window.windowWidth * 0.4;
    float y = randomGaussian() * Window.windowHeight * 0.4;
    walkers[i] = new Walker(x, y);
    
    walkers[i].scale = random(15, 70);
    walkers[i].mass = walkers[i].scale + 15;
  }
}

void draw() {
  background(255);
  
  for (Walker e : walkers) {
    e.update();
    e.render();
    for (Walker j : walkers)
    {
      if (e != j)
      {
        e.applyForce(j.calculateAttraction(e));
      }
    }
  }
}
