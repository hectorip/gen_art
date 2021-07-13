void setup() {
    size(540, 540);    
}

void draw() {
    background(0);    
    translate(width/2.0, height/2.0);

    float radius = (4 * width/5) / 2.0;
    int segments = round(radius * 0.25);
    float segmentAngle = TWO_PI / segments;

    for (int segment = 0; segment < segments; ++segment) {
        float segmentFrameOffset = segment * 2.0;
        float z = sin((frameCount + segmentFrameOffset) * TWO_PI/360);
        float segmentRadius = z * radius;

        float angle = segmentAngle * segment;
        float x = segmentRadius * cos(angle);
        float y = segmentRadius * sin(angle);

        noStroke();
        fill(segmentFrameOffset % 256, 0, 255 - (segmentFrameOffset % 256), 255);
        circle(x, y, z * 10.0);
        
        
        float z2 = cos((frameCount + segmentFrameOffset) * TWO_PI/360);
        float segmentRadius2 = z2 * radius;

        float x2 = segmentRadius2 * cos(angle);
        float y2 = segmentRadius2 * sin(angle);
        fill(255, 0, 0, 255);
        circle(x2, y2, z * 10.0);
    }

}