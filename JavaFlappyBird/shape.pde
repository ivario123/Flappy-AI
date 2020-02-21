class Shape{
 float x,y,w,h,v;
 Shape(float x, float y, float w, float h, float v) {
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.v = v;
 }
 void update(){
   x+=v;
 }
 
 void Draw(color c){
   fill(c);
   rect(x,y,w,h);
 }
 boolean collide(bird b){
   //ellipse(x,y,10,10);
   if(b.x+b.r>=x&&b.x-b.r<=x+w){
     if(b.y-b.r<=y+h&&b.y+b.r>=y){ //<>//
       return true; //<>//
     }
   }
   return false;
 }
}
