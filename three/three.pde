float noiseScale = 0.015;
int duration = 120;

float easeInOutCubic(float x) {
    return x < 0.5 ? 4 * x * x * x : 1 - pow(-2 * x + 2, 3) / 2;
}

void setup() {
  size(540, 540);
}

void draw() {
  blendMode(ADD);
  background(0);
  randomSeed(150);

  float startX = random(width);
  float startY = random(height);
  int dimension = 200;

  float previousX = startX;
  float previousY = startY;

  for (int particle = 0; particle < dimension; ++particle) {
    float frames = frameCount % 120;
    float time = map(frames, 0.0, 120.0, 0.0, 1.0);
    float ease = easeInOutCubic(time);

    float angle = TWO_PI * noise(previousX * noiseScale, previousY * noiseScale);
    float x = previousX + cos(angle);
    float y = previousY + sin(angle);

    previousX = x;
    previousY = y;

    int particleIndex = (int) map(ease, 0.0, 1.0, 0.0, dimension);
    int lowIndex = particleIndex - 30;
    int upIndex = particleIndex + 30;

    boolean drawParticle = particle >= lowIndex && particle <= upIndex;

    float maxAlpha = sin(map(ease, 0.0, 1.0, 0.0, PI)) * 30.0;

    if (drawParticle) {
      float alpha = map(particle, lowIndex, upIndex, 0.0, maxAlpha);

      noStroke();
      fill(255, alpha);
      circle(x, y, 10.0);
    }
  }

}