float uV = -3;
float uW = .1f;
int[] arc =  {10, 1,9, 1};
ArrayList<bird> birds = new ArrayList<bird>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
ArrayList<bird> dead = new ArrayList<bird>();
int delay = 90;
int frames = 0;
int pop = 12000;
void setup() {
  size(500, 500, P2D);
  uW = uW*height;
  for (int i = 0; i < pop; i++)
    birds.add(new bird());
  //pipes.add(new Pipe(uW*2));
}
Pipe closest = new Pipe(uW*2);
void draw() {

  if (frames%delay==0) pipes.add(new Pipe(uW*2));
  closest = pipes.get(0);
  background(0);
  for (int i = pipes.size()-1; i >-1; i--) {
    pipes.get(i).c =  color(255, 0, 0);
    if (pipes.get(i).x<closest.x) {
      closest = pipes.get(i); 
      //println("gucci");
    }
    pipes.get(i).update();
    if (pipes.get(i).x<0) { 
      pipes.remove(i); 
      //println("yote");
    }
  }
  closest.c =  color(0, 255, 0);
  for (int i = birds.size()-1; i>-1; i--) {
    birds.get(i).update(closest);
    if (closest.collide(birds.get(i))||birds.get(i).y<0||birds.get(i).y>height) {
      birds.get(i).nn.fitness = frames^2;
      birds.get(i).fitness = frames^2;
      dead.add(birds.get(i));
      birds.remove(i);
      //println("kil "+i);
    }
  }
  frames++;
  if (dead.size()==pop) nextgen();
  for (Pipe p : pipes)p.Draw();
  birds.get(0).Draw();
  text(birds.size(),20,20);
}

void keyPressed() {

  if (keyCode == ' ') birds.get(0).jump();
}
void nextgen() {
  bird best = new bird();
  for(bird b : dead)
  if(best.fitness< b.fitness) best = b;
  for(int i = 0; i < pop; i++){
   birds.add(best.cross(dead.get(i)));
   birds.get(i).nn.mutate();
  }
  dead.clear();
  pipes.clear();
  frames = 0;
}
