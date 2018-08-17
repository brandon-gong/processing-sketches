ArrayList<Particle> particles;
int NUM_PARTICLES = 400;
float particleSpeed = 2;
int maxdistance = 100;
int bg = color(253, 246, 227);
int fg = color(211, 54, 130);

PGraphics textconstraint;

void setup() {
    fullScreen();
    stroke(fg);
    fill(fg);
    particles = new ArrayList<Particle>();
    for(int i = 0; i < NUM_PARTICLES; i++) {
        particles.add(new Particle());
    }
    maxdistance *= maxdistance;
   // textconstraint = createGraphics(width, height);
   // textconstraint.beginDraw();
   // textconstraint.textFont(createFont("Source Sans Pro Black", 450, false));
   // textconstraint.textAlign(CENTER, CENTER);
   // textconstraint.background(0);
   // textconstraint.fill(255);
   // textconstraint.stroke(255);
   // textconstraint.text("TEST", width/2, height/2);
   // textconstraint.endDraw();
   // textconstraint.loadPixels();
   // println(textconstraint.pixels.length);
}

void draw() {
    background(bg);
    for(int i = 0; i < NUM_PARTICLES; i++) {
        particles.get(i).update();
       //particles.get(i).show();
    }
    for(int j = 0; j < NUM_PARTICLES; j++) {
        int connections = 0;
        boolean noDraw = false;
        for(int i = 0; i < NUM_PARTICLES; i++) {
            /*if(textconstraint.pixels[min(textconstraint.pixels.length - 1, floor(particles.get(j).pos.y * width + particles.get(j).pos.x))] != color(255)) {
                particles.get(j).reinit();
                noDraw = true;
            } else*/ if(Math.pow(particles.get(i).pos.x - particles.get(j).pos.x, 2)
             + Math.pow(particles.get(i).pos.y - particles.get(j).pos.y, 2)
             < maxdistance) {
                line(particles.get(j).pos.x, particles.get(j).pos.y, particles.get(i).pos.x, particles.get(i).pos.y);
                connections++;
            }
        }
        if(!noDraw) ellipse(particles.get(j).pos.x, particles.get(j).pos.y, 5, 5);
    }
}

class Particle {
    public PVector pos;
    PVector vel;
    float theta;

    public Particle() {
        pos = new PVector(random(width), random(height));
        vel = PVector.fromAngle(random(1) * TWO_PI);
        vel.setMag(particleSpeed);
        theta = atan2(vel.y, vel.x);
    }

    void update() {
        pos.add(vel);
       // if(pos.x < 0) {
       //     vel.rotate(PI - 2 * atan(vel.y / vel.x));
       // }
       // else if(pos.x > width) {
       //     vel.rotate(PI + 2 * atan(vel.y / vel.x));
       // }
       // else if(pos.y < 0) {
       //     vel.rotate(PI + 2 * atan(vel.y / vel.x));
       // }
       // else if (pos.y > height) {
       //     vel.rotate(PI + 2 * atan(vel.y / vel.x));
       // }
        if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
            reinit();
        }
    }

    void reinit() {
        pos = new PVector(random(width), random(height));
        vel = PVector.fromAngle(random(1) * TWO_PI);
        vel.setMag(particleSpeed);

    }
    void show() {
        ellipse(pos.x, pos.y, 4,4);
    }
}
