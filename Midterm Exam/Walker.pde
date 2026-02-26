public class Walker {
  PVector position;
  PVector velocity;
  float scale;
  color finalRandomizedColor;
  int alpha = 70;

  Walker(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0); 
    randomizeColor();
    randomScale();
  }

  Walker(PVector pos) {
    position = pos.copy();
    velocity = new PVector(0, 0);
    randomizeColor();
    randomScale();
  }

  void render() {
    fill(finalRandomizedColor);
    noStroke();
    circle(position.x, position.y, scale);
  }

  void randomizeColor() {
    finalRandomizedColor = color(int(random(256)), int(random(256)), int(random(256)), alpha);
  }

  void randomScale() {
    float gaussian = randomGaussian();
    float standardDeviation = 15;
    float mean = 10;
    scale = standardDeviation * gaussian + mean;
    scale = max(scale, 2);
  }
}
