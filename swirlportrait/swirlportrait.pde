String imgname = "test.jpg";

PImage img;

// these two variables affect each other so you'll probably
// need to tweak both.
float swirlDensity = 0.03;
float resolution = 0.02;

float angle = 0;
float mag = 0;
PVector pre = new PVector(0, 0);
PVector neo = new PVector(0, 0);

void setup() {
    img = loadImage(imgname);
    img.resize(900, 0);
    img.filter(GRAY);
    size(800, 800);
    background(255);
    stroke(0);
    strokeWeight(1);
}

void draw() {
    translate(width/2, height/2);
    //image(img, 0, 0);
    neo = PVector.fromAngle(angle);
    neo.mult(mag);
    color c = img.get(450 + round(neo.x), 450 + round(neo.y));
    strokeWeight((255-green(c)) * 6 / 255);
    line(pre.x, pre.y, neo.x, neo.y);
    mag += swirlDensity;
    angle += resolution;
    pre = neo;
}
