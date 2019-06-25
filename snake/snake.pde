int TILE_SIZE = 20;
int TILE_PADDING = 2;
int TILE_RADIUS = 5;

int BACKGROUND_COLOR = color(60, 56, 54);
int TILE_COLOR = color(40, 40, 40);
int SNAKE_COLOR = color(235, 219, 178);
int HEAD_COLOR = color(142, 192, 124);
int DEATH_COLOR = color(251, 73, 52);
int FOOD_COLOR = color(131, 165, 152);
int SCORE_COLOR = color(250, 189, 47);

int DELAY_FRAME = 50;
int food_x, food_y;

ArrayList<Integer> body_positions = new ArrayList<Integer>();
int heading = 0;
int snakeLength = 3;
boolean isDead = false;

void redrawTile(int x, int y, int colour) {
    fill(BACKGROUND_COLOR);
    rect(x*TILE_SIZE+TILE_SIZE/2 - 2, y*TILE_SIZE + TILE_SIZE/2 - 2, TILE_SIZE-TILE_PADDING+2, TILE_SIZE-TILE_PADDING+2);
    fill(colour);
    rect(x*TILE_SIZE+TILE_SIZE/2, y*TILE_SIZE + TILE_SIZE/2, TILE_SIZE-TILE_PADDING, TILE_SIZE-TILE_PADDING, TILE_RADIUS);
}

void setup() {
    size(400, 400);
    smooth(5);
    noStroke();
    PFont font = createFont("ARCADECLASSIC.TTF", 25);
    textFont(font);
    init();
}

void init() {
    isDead = false;
    body_positions = new ArrayList<Integer>();
    snakeLength = 3;
    heading = 0;
    background(BACKGROUND_COLOR);
    frameRate(10);
    for(int i = 0; i < width / TILE_SIZE - 1; i++) {
        for(int j = 0; j < height / TILE_SIZE - 2; j++) {
            redrawTile(i, j, TILE_COLOR);
        }
    }
    for(int i = 0; i < snakeLength; i++) {
        body_positions.add(i);
        body_positions.add(0);
    }
    for(int i = 0; i < body_positions.size() - 1; i+=2) {
        redrawTile(body_positions.get(i), body_positions.get(i+1), SNAKE_COLOR);
    }
    redrawTile(body_positions.get(body_positions.size()-2), body_positions.get(body_positions.size()-1), HEAD_COLOR);
    randomFood();
    redrawTile(food_x, food_y, FOOD_COLOR);
    fill(184, 187, 38);
    text("SNAKE   V1", width - 115, height - 10);
}

void draw() {
    if(isDead) return;
    if(heading == 0) {
        body_positions.add(body_positions.get((snakeLength-1)*2)+1);
        body_positions.add(body_positions.get((snakeLength-1)*2+1));
    } else if(heading == 1) {
        body_positions.add(body_positions.get((snakeLength-1)*2));
        body_positions.add(body_positions.get((snakeLength-1)*2+1)+1);
    } else if(heading == 2) {
        body_positions.add(body_positions.get((snakeLength-1)*2)-1);
        body_positions.add(body_positions.get((snakeLength-1)*2+1));
    } else {
        body_positions.add(body_positions.get((snakeLength-1)*2));
        body_positions.add(body_positions.get((snakeLength-1)*2+1)-1);
    }
    redrawTile(body_positions.get(body_positions.size()-4), body_positions.get(body_positions.size()-3), SNAKE_COLOR);
    redrawTile(body_positions.get(body_positions.size()-2), body_positions.get(body_positions.size()-1), HEAD_COLOR);
    int head_x = body_positions.get(body_positions.size() - 2);
    int head_y = body_positions.get(body_positions.size() - 1);
    if(head_x < 0 || head_y < 0) {
        redrawTile(head_x, head_y, DEATH_COLOR);
        isDead=true;
    }
    if(head_x > width / TILE_SIZE - 2 || head_y > height / TILE_SIZE - 3) {
        redrawTile(head_x, head_y, DEATH_COLOR);
        isDead=true;
    }
    for(int i = 0; i < body_positions.size() - 4; i+=2) {
        if(body_positions.get(i) == head_x) {
            if(body_positions.get(i+1) == head_y) {
                redrawTile(head_x, head_y, DEATH_COLOR);
                isDead=true;
            }
        }
    }
    if(head_x == food_x && head_y == food_y) {
        snakeLength++;
        randomFood();
        redrawTile(food_x, food_y, FOOD_COLOR);
    }
    else {
        redrawTile(body_positions.get(0), body_positions.get(1), TILE_COLOR);
        body_positions.remove(0);
        body_positions.remove(0);
    }
    fill(BACKGROUND_COLOR);
    rect(0, height-TILE_SIZE*1.5, 135, TILE_SIZE*1.5);
    fill(SCORE_COLOR);
    text("Score   " + snakeLength, TILE_SIZE/2, height-TILE_SIZE/2);
}

void randomFood() {
    int new_food_x = 0;
    boolean bad_x = true;
    int new_food_y = 0;
    boolean bad_y = true;
    while(bad_x && bad_y) {
        bad_x = false;
        bad_y = false;
        new_food_x = (int) random(width / TILE_SIZE - 1);
        new_food_y = (int) random(height / TILE_SIZE - 2);
        for(int i = 0; i < body_positions.size()-1; i++) {
            if(body_positions.get(i) == new_food_x) bad_x = true;
            if(body_positions.get(i+1) == new_food_y) bad_y = true;
        }
    }
    food_x = new_food_x;
    food_y = new_food_y;
}

void keyPressed() {
    if(keyCode == 38) heading = 3;
    else if(keyCode == 39) heading = 0;
    else if(keyCode == 40) heading = 1;
    else if(keyCode == 37) heading = 2;
    else if(keyCode == 32) init();
}
