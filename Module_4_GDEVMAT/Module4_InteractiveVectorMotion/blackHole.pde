public class BlackHole {
  PVector position;
  float scale = 50;

  BlackHole() {
    float x = random(Window.left, Window.right);
    float y = random(Window.bottom, Window.top);
    position = new PVector(x, y);
  }

  void render() {
    fill(0);
    noStroke();
    circle(position.x, position.y, scale);
  }
}
