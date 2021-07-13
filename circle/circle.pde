import processing.pdf.*;  // Import PDF code


void setup(){
    size(500, 500);
    smooth();
    pixelDensity(displayDensity());
}

void draw(){
    translate(width / 2.0, height / 2.0);
    background(color(0.0, 0.0, 0.0));
    float squareSize = 4 * width / 5.0;
    int lines = 1000;
    float lineOffset = squareSize / lines;
    float totalFrames = 220;
    float time = map(frameCount % totalFrames, 0, totalFrames, 0.0, 1.0);

    fill(0.0);
    strokeWeight(2.0);
    stroke(255.0);
    rectMode(CENTER);
    // rect(0.0, 0.0, squareSize, squareSize);

    for (int line = 0; line <= lines; line++) {
        // Dibujado de lineas
        float startX = -squareSize/2.0;
        float endX = squareSize / 2.0;
        float y = -squareSize/2.0 + (line * lineOffset);

        // Particulas

        // float variation = map(mouseX, 0.0, width, -50.0, 50.0);
        // println(variation);
        float variation = -0.5;
        float particleTimeOffset = line * variation;
        float particleTime = map((frameCount + particleTimeOffset) % totalFrames, 0, totalFrames, 0.0, 1.0);
        float theta = map(particleTime, 0.0, 1.0, 0.0, TWO_PI);
        float particleX = map(pow(sin(theta), 5), -1.0, 1.0, startX, endX);//map(time, 0, 1.0, startX, endX);
        float particleY = y;
        float particleColor = pow(cos(theta), 2.0) * 255.0;
        float radius = pow(cos(theta), 2.0) * 20.0; 
        // fill(color(0, 0, 255.0*particleColor), particleColor);
        fill(255-particleColor, 0, particleColor, particleColor);
        noStroke();
        circle(particleX, particleY, radius);
    }
    // if(frameCount <= 440){
    //     saveFrame("one/circles-####.png");
    // }
}

