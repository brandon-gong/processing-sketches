// Stipple Portrait - Jim Bumgardner
//
// V1.1 12/1/11  


float  damping = 0.8;
float  kRadiusFactor = 0.5;
float  kSpeed = 3.0;
float  minDistFactor = 2.5; // area of influence - smaller numbers make rendering go faster
int  nbrParticles = 10000; // 20000; // 6000;
PImage img;

// for 20,000 dots, use 1-3.5
// for 5000 dots, use 1-2

class Particle
{
  float  x,y,vx,vy,rad;
  float  fx,fy,wt;

  Particle()
  {
    vx = 0;
    vy = 0;
    x = random(1)*width;
    y = random(1)*height;
    rad = width*kRadiusFactor/sqrt(nbrParticles);
    rad += random((int)(rad/2));
  }
}

Particle[] particles;
float sc = 10;

float minRadius,maxRadius,medRadius;

void setup()
{
  img = loadImage("IMG_4415.JPG");
  size(1126,2000); // this has to match the size of the image...

  float medArea = (width*height)/nbrParticles;
  medRadius = sqrt(medArea/PI);
  minRadius = medRadius; // using medRadius > 1 improves black areas
  maxRadius = medRadius*medRadius;
  println("medrad = " + medRadius);
  println("min-max = " + minRadius + " --> " + maxRadius);

  //frameRate(24);
  // noLoop();
  smooth();
  noStroke();
  particles = new Particle[nbrParticles];
  for (int i = 0; i < nbrParticles; ++i)
    particles[i] = new Particle();
}

void doPhysics()
{
  // println("sc = " + sc);

  for (int i = 0; i < nbrParticles; ++i) {
    int px = (int) particles[i].x;
    int py = (int) particles[i].y;
    if (px >= 0 && px < img.width && py >= 0 && py < img.height) {
      int v = (int) red(img.pixels[ py*img.width + px ]);
      particles[i].rad = map(v/255.0,0,1,minRadius,maxRadius);
    }
  }
  
  for (int i = 0; i < nbrParticles; ++i) {
    Particle p = particles[i];
    p.fx = p.fy = p.wt = 0;

    p.vx *= damping;
    p.vy *= damping;

  }

  // Particle -> particle interactions
  for (int i = 0; i < nbrParticles-1; ++i) {
    Particle p = particles[i];
    for (int j = i+1; j < nbrParticles; ++j) {
      Particle pj = particles[j];
      if (i== j || Math.abs(pj.x - p.x) > p.rad*minDistFactor ||
          Math.abs(pj.y - p.y) > p.rad*minDistFactor)
          continue;

      double  dx = p.x - pj.x;
      double  dy = p.y - pj.y;
      double  distance = Math.sqrt(dx*dx+dy*dy);
      
      double  maxDist = (p.rad + pj.rad);
      double  diff = maxDist - distance;
      if (diff > 0) {
        double scle = diff/maxDist;
        scle = scle*scle;
        p.wt += scle;
        pj.wt += scle;
        scle = scle*kSpeed/distance;
        p.fx += dx*scle;
        p.fy += dy*scle;
        pj.fx -= dx*scle;
        pj.fy -= dy*scle;
      }
    }
  }
  
  for (int i = 0; i < nbrParticles; ++i) {
    Particle p = particles[i];

       // keep within edges
    double dx,dy,distance,scle,diff;
    double maxDist = p.rad;
    // left edge  
    distance = dx = p.x - 0;    dy = 0;
    diff = maxDist - distance;
    if (diff > 0) {
	scle = diff/maxDist;
	scle = scle*scle;
	p.wt += scle;
	scle = scle*kSpeed/distance;
        p.fx += dx*scle;
        p.fy += dy*scle;
    }
    // right edge  
    dx = p.x - width;    dy = 0;
    distance = -dx;
    diff = maxDist - distance;
    if (diff > 0) {
	scle = diff/maxDist;
	scle = scle*scle;
	p.wt += scle;
	scle = scle*kSpeed/distance;
        p.fx += dx*scle;
        p.fy += dy*scle;
    }
    // top edge
    distance = dy = p.y - 0;    dx = 0;
    diff = maxDist - distance;
    if (diff > 0) {
	scle = diff/maxDist;
	scle = scle*scle;
	p.wt += scle;
	scle = scle*kSpeed/distance;
        p.fx += dx*scle;
        p.fy += dy*scle;
    }
    // bot edge  
    dy = p.y - height;    dx = 0;
    distance = -dy;
    diff = maxDist - distance;
    if (diff > 0) {
	scle = diff/maxDist;
	scle = scle*scle;
	p.wt += scle;
	scle = scle*kSpeed/distance;
        p.fx += dx*scle;
        p.fy += dy*scle;
    }
    if (p.wt > 0) {
      p.vx += p.fx/p.wt;
      p.vy += p.fy/p.wt;
    }
    p.x += p.vx;
    p.y += p.vy;
  }
}

int passes;

void draw()
{
  doPhysics();
  background(255);
  stroke(0);
  strokeWeight(medRadius*1.5);
  for (int i = 0; i < nbrParticles; ++i) {
    // particles[i].x += .1;
 //   if (i == 0)
 //     println(particles[i].x);
    // strokeWeight(min(4,particles[i].rad*2));
    point(particles[i].x, particles[i].y);
  }
  // println(passes++);
  if (frameCount == 20) {
    println("SNAP");
    save("test.png");
  }
}

void keyPressed() {
  if (key == 's') {
    println("SNAP");
    saveFrame("test.png");
  }
}
