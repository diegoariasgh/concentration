class Mover {
  PVector loc, vel, acc;
  float mass;
  color palette;


  Mover(float x, float y, float _mass, color _palette) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = _mass;
    palette = _palette;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void display() {
    ellipse(loc.x, loc.y, mass, mass);
  fill(red(palette), green(palette), blue(palette), timeColor);
  noStroke();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void checkEdges() {
    if (loc.x>width ) {
      loc.x=width;
      vel.x*=-1;
    } else if (loc.x < 0 ) {
      loc.x=0;
      vel.x*=-1;
    } 
    if (loc.y>height) {
      loc.y= height;
      vel.y*=-1;
    } else if (loc.y<0) {
      loc.y=0;
      vel.y*=-1;
    }
  }
  
}
