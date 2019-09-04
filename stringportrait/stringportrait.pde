int numPoints = 180;
int numGenRand = 200;
int numLines = 5500;
int curLine = 0;

int radius = 350;
ArrayList<PVector> imagePoints = new ArrayList<PVector>();
ArrayList<PVector> canvasPoints = new ArrayList<PVector>();
PImage img;
int fadeStep = 10;
float lineAlpha = 0.3f;
int substep = 10;

void setup() {
  size(900, 900);
  background(255);
  img = loadImage("IMG_52622.JPG");
  img.filter(GRAY);
  img.resize(700, 700);
  img.loadPixels();
  for(int i = 0; i < numPoints; i++) {
    imagePoints.add(new PVector(img.width / 2 * sin(2*PI*i/numPoints) + img.width / 2, img.height / 2 * cos(2*PI*i/numPoints) + img.height / 2));
    canvasPoints.add(new PVector(radius * sin(2*PI*i/numPoints) + width / 2, radius * cos(2*PI*i/numPoints) + height/2));
  }
}

PVector getBestPointPair() {
  ArrayList<PVector> candidates = new ArrayList<PVector>();
  for(int i = 0; i < numGenRand; i++) {
    int p1 = floor(random(1)*numPoints);
    int p2 = floor(random(1)*numPoints);
    if(p1 == p2) {
      i--;
    } else {
      candidates.add(new PVector(p1, p2));
    }
  }
  float minBrightness = 255;
  int bestIndex = 0;
  for(int i = 0; i < candidates.size(); i++) {
    int p1 = (int) candidates.get(i).x;
    int p2 = (int) candidates.get(i).y;
    int pointX1 = (int) imagePoints.get(p1).x;
    int pointY1 = (int) imagePoints.get(p1).y;
    int pointX2 = (int) imagePoints.get(p2).x;
    int pointY2 = (int) imagePoints.get(p2).y;
    float b = getLineBrightness(pointX1, pointY1, pointX2, pointY2);
    if(b < minBrightness) {
      bestIndex = i;
      minBrightness = b;
    }
  }
  return candidates.get(bestIndex);
}

float getLineBrightness(int x1, int y1, int x2, int y2) {
  float result = 0;
  int xOffset = abs(x1-x2);
  int yOffset = abs(y1-y2);
  int sstep = (xOffset < yOffset) ? yOffset : xOffset;
  for(int i = 0; i < sstep; i++) {
    int x = floor(x1 + (x2 - x1) * ((float) i / sstep));
    int y = floor(y1 + (y2 - y1) * ((float) i / sstep));
    float b = brightness(img.get(x, y));
    result += b;
  }
  return result / sstep;
}

void fadeLineFromImg(int x1, int y1, int x2, int y2) {
  int xOffset = abs(x1-x2);
  int yOffset = abs(y1-y2);
  int sstep = (xOffset < yOffset) ? yOffset : xOffset;
  for(int i = 0; i < sstep; i++) {
    int x = floor(x1 + (x2 - x1) * ((float) i / sstep));
    int y = floor(y1 + (y2 - y1) * ((float) i / sstep));
    int index = y * img.width + x;
    //index *= 4;
    try {
      float oldr = red(img.pixels[index]);
      float newr = oldr + fadeStep;
      newr = constrain(newr, 0, 255);
      img.pixels[index] = color(newr);
      oldr = red(img.pixels[index + 1]);
      newr = oldr + fadeStep;
      newr = constrain(newr, 0, 255);
      img.pixels[index+1] = color(newr);
      oldr = red(img.pixels[index+2]);
      newr = oldr + fadeStep;
      newr = constrain(newr, 0, 255);
      img.pixels[index+2] = color(newr);

  } catch (Exception e) {}

}
}
void draw() {
  for(int i = 0; i < substep; i++) {
    if(curLine < numLines) {
      PVector pointIndices = getBestPointPair();
      int p1 = (int) pointIndices.x;
      int p2 = (int) pointIndices.y;
      strokeWeight(1);
      stroke(0, 70);
      line(canvasPoints.get(p1).x, canvasPoints.get(p1).y, canvasPoints.get(p2).x, canvasPoints.get(p2).y);
      fadeLineFromImg((int) imagePoints.get(p1).x, (int) imagePoints.get(p1).y, (int) imagePoints.get(p2).x, (int) imagePoints.get(p2).y);
      if (curLine % 10 == 0) save(curLine + ".png");
      curLine++;
      //img.updatePixels();
      //image(img, 100, 100);
    } else {
      noLoop();
      break;
    }
  }
}
