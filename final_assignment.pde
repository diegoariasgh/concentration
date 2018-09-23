Mover[] movers = new Mover[1000];
color[] arrayOfColors = new color[4];
Liquid liq;

Attractor a1;
Attractor a2;
Repeller r;

float timeColor = 200;
float timeWind;

void setup() {
  size(800, 600);
  //colors
  arrayOfColors[0] = color(178,196,207);
  arrayOfColors[1] = color(140,147,168);
  arrayOfColors[2] = color(98,70,107);
  arrayOfColors[3] = color(69,54,75);

  int whichColor=0;

  //movers
  for (int i =0; i < movers.length; i++) {
    if (i%250==0 && i>0)
      whichColor++;
    movers[i] = new Mover(i+width/1000, height, 5, arrayOfColors[whichColor]);
  }
  a1 = new Attractor(2*width/5, 2*height/5 +100, 80);
  a2 = new Attractor(3*width/5, 1*height/5 +100, 100);

  liq = new Liquid(0, height/2 +100, width, height/2 +100, 1);
  
  r = new Repeller(3*width/5, height/5 + 100, 1000);
}

void draw() {
  background(235,235,235);
  timeColor = timeColor - .05;
  //using an enhanced for loop for the attractors posed several issues

  for (Mover m : movers) {   
    PVector wind = new PVector(0, -.01);
    m.applyForce(wind);

    if (liq.contains(m)) {
      m.applyForce(liq.dragForce(m));
    }

    if (timeColor < 50) {
      m.applyForce(r.repellingForce(m));
    } else {
      m.applyForce(a1.attractionForce(m));
      m.applyForce(a2.attractionForce(m));
    } 

    m.update(); 
    m.checkEdges();
    m.display();
  }
  //a1.display();
  //a2.display();
}


//make repeller class
//choose colors
//choose color for background make palette of 6
