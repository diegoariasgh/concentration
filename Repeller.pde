class Repeller {
  float mass;
  PVector loc;

  Repeller(float x, float y, float _mass) {
    loc = new PVector (x, y);
    mass = _mass;
  }
  PVector repellingForce(Mover m) {
    PVector force = PVector.sub(loc, m.loc);
    float distance = force.mag();
    force.normalize();
    distance *= distance;
    distance = constrain(distance, 5, 20);
    float forceMag = (mass*m.mass)/(distance*distance);
    force.mult(forceMag*-1);
    return force;
  }
  
  void display() {
    ellipse(loc.x, loc.y, 10, 10);
  }
  
}
