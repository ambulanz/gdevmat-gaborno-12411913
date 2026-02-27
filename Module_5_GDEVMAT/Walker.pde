public class Walker {
  PVector position;
  PVector velocity;
  float velocityLimit = 10;
  float scale;
  color finalRandomizedColor;
  int alpha = 70;
  float mass;
  PVector acceleration = new PVector();

  Walker(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0); 
    randomizeColor();
  }

  Walker(PVector pos) {
    position = pos.copy();
    velocity = new PVector(0, 0);
    randomizeColor();
  }

  void render() {
    fill(finalRandomizedColor);
    circle(position.x, position.y, scale);
  }

  void randomizeColor() {
    finalRandomizedColor = color(int(random(256)), int(random(256)), int(random(256)), alpha);
  }

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
     this.velocity.add(this.acceleration);
     this.velocity.limit(velocityLimit);
     this.position.add(this.velocity);
     this.acceleration.mult(0);
     
  }
}
