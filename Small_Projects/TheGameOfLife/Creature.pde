class Creature{
  
 int posX;
 int posY;
 boolean isAlive;
 boolean wasAlive;
 int aliveSince;
 int deadSince;
 int size;
 
  public Creature(int posX,int posY, int size){
   this.posX = posX;
   this.posY = posY;
   this.isAlive = false;
   this.wasAlive = false;
   this.aliveSince = 0;
   this.size = size;
 }
 
  public Creature(int posX,int posY,boolean alive, int size){
   this.posX = posX;
   this.posY = posY;
   this.isAlive = alive;
   this.wasAlive = false;
   this.aliveSince = 0;
   this.size = size;
 }
 
 void show(int time){
   if (isAlive){
     int colour = (int) map(aliveSince,0,time,255,0);
     fill(255,colour,0);
     rect(this.posX * size,this.posY * size,size,size);
   }
   else if (wasAlive){
     int colour = (int) map(deadSince,0,time,50,0);
     fill(colour);
     rect(this.posX * size,this.posY * size,size,size);
   }
 }
 
 void live(){
   if(isAlive){
     aliveSince++;
   }
   else{
     aliveSince = 0;
   }
 }
  
 void die(){
   if (wasAlive){
     deadSince++;
   }
   else {
     deadSince = 0;
   }
 }
}
