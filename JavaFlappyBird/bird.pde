class bird {
  float x, y, r, v, g, jump, fitness;
  NN nn;
  bird() {
    x = width*.2;
    y = height/2;
    r = width*0.05;
    v = 0;
    g = .2;
    jump = -4;
    nn = new NN(arc, 1);
    nn.mutate();
    fitness = 0;
  }

  void Draw() {
    ellipse(x, y, r, r);
  }

  bird cross(bird b) {
    bird temp = new bird();
    temp.nn.IH = Matrix.nCross(nn.IH, b.nn.IH, fitness, b.fitness);
    for (int i = 0; i < nn.HH.length; i++)
      temp.nn.HH[i] = Matrix.nCross(nn.HH[i], b.nn.HH[i], fitness, b.fitness);
    temp.nn.HO = Matrix.nCross(nn.HO, b.nn.HO, fitness, b.fitness);
    return temp;
  }
  void update(Pipe closest) {
    float[] inp;
    if (pipes.size()>1) {
      inp =new float[]{
        map(y, 0, height, 0, 1), 
        map(v, 10, -10, 0, 1), 
        map(closest.x, 0, width, 0, 1), 
        map(closest.y, 0, height, 0, 1), 
        map(closest.gap, 0, height, 0, 1), 
        map(closest.velocity, 0, 10, 0, 1), 
        map(pipes.get(1).x, 0, width, 0, 1), 
        map(pipes.get(1).y, 0, height, 0, 1), 
        map(pipes.get(1).gap, 0, height, 0, 1), 
        map(pipes.get(1).velocity, 0, 10, 0, 1)
      };
    }
    else{
      float[] inp =new float[]{
        map(y, 0, height, 0, 1), 
        map(v, 10, -10, 0, 1), 
        map(closest.x, 0, width, 0, 1), 
        map(closest.y, 0, height, 0, 1), 
        map(closest.gap, 0, height, 0, 1), 
        map(closest.velocity, 0, 10, 0, 1), 
        0, 
        0, 
        0, 
        0
      };
    }
    if (nn.ff(inp)[0]>.5f) jump();
    v+=g;
    y+=v;
  }
  void jump() {
    v+=jump;
  }
}
