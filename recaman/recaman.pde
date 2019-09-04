float resolution = 0.01;
int RECAMAN_ITERATIONS = 59;
ArrayList<Integer> recamanSequence = new ArrayList<Integer>();

void setup() {
  size(800, 800);
  background(255);
  noFill();
  stroke(0);
  noLoop();
  strokeWeight(1.2);
  smooth(3);

  // generate recaman
  recamanSequence.add(0);
  for(int i = 1; i <= RECAMAN_ITERATIONS; i++) {
    int candidateNumber = recamanSequence.get(recamanSequence.size() - 1) - i;
    if(!(recamanSequence.contains(candidateNumber)) && (candidateNumber > 0)) {
      recamanSequence.add(candidateNumber);
    } else {
      recamanSequence.add(recamanSequence.get(recamanSequence.size() - 1) + i);
    }
  }
}

void draw() {

  // calculate max value in recaman (used for scaling)
  int recamanMax = -1;
  for(int i = 0; i < recamanSequence.size(); i++) {
    if(recamanSequence.get(i) > recamanMax) recamanMax = recamanSequence.get(i);
  }

  for(int i = 0; i < recamanSequence.size() - 1; i++) {
    
    // prepare for spaghetti

    // calculate the endpoints of the semicircle in pixel coords
    float x1 = (recamanSequence.get(i) / ( (float) recamanMax))*(width - 200) + 50;
    float y1 = -1 * height / width * x1 + height;
    float x2 = (recamanSequence.get(i+1) / ( (float) recamanMax))*(width - 200) + 50;
    float y2 = -1 * height / width * x2 + height;

    // get distance / midpoint for radius / center of semicircle, respectively
    float radius = 0.5 * sqrt(pow(y2 - y1, 2) + pow(x2 - x1, 2));
    float midX = (x1 + x2) / 2;
    float midY = (y1 + y2) / 2;

    // draw semicircle
    beginShape();
    float angle = 3*PI/4;
    while((angle >  -1*PI/4) && (angle<7*PI/4)) {
      PVector nextVertex = PVector.fromAngle(angle);
      nextVertex.mult(radius);
      float x = nextVertex.x + midX;
      float y = nextVertex.y + midY;
      vertex(x, y);
      if(i % 2 == 0) {
        angle += resolution;
      } else {
        angle -= resolution;
      }
    }
    if(x2 > x1) {
      vertex(x2, y2);
    } else {
      vertex(x1, y1);
    }
    endShape();

  }

  saveFrame("out.png");
}
