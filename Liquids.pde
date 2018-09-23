class Liquid{
  int x,y,w,h;
  float c;
  
  Liquid(int _x, int _y, int _w, int _h, float _c){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }
  
  boolean contains(Mover m){
    if (m.loc.x > x && m.loc.x < x+w && m.loc.y > y && m.loc.y < y+h){
      return true;
    }
    else{
      return false; 
    }
  }
  

  void display(){
    fill(70);
    rect(x,y,w,h);
  }
  
  PVector dragForce(Mover m){
    PVector force = m.vel.copy(); 
    float speed = force.mag(); 
    force.normalize(); 
    speed *= speed;
    force.mult(-1); 
    force.mult(c); 
    force.mult(speed); 
    return force; 
  }
  
  }
