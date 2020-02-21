class Pipe{
 float x,y,gap,w;
 float velocity;
 Shape u,d;
 color c =  color(255,0,0);
 Pipe(float gap){
   y = random(20,height-20-gap);
   w = uW;
   x = width-w;
   velocity = uV;
   this.gap = gap;
   u = new Shape(x,0,w,y,velocity);
   d = new Shape(x,height,w,-(height-(y+gap)),velocity);
 }
 
 void update(){
   x+=velocity;
   d.update();
   u.update();
   
 }
 void Draw(){
  d.Draw(c);
  u.Draw(c);
 }
  boolean collide(bird b){
    //ellipse(x,y,gap,gap);
    //rect(x,y,w,gap);
    if(b.x>x&&b.x<x+w){
     if(b.y-b.r>y&&b.y+b.r<y+gap){
      return false;  //<>//
     }
     else return true;
    }
    return false;
  }
  
}
