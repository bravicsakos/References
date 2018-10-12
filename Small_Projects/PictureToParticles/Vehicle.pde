class Vehicle {
  PVector pos;
  PVector acttarget;
  PVector target;
  PVector vel;
  PVector acc;
  float maxSpeed = 5;
  float maxForce = 0.3;
  boolean exploded;
  
  public Vehicle(float x, float y){
    pos = new PVector(x,y);
    target = new PVector(x,y);
    acttarget = new PVector(x,y);
    vel = new PVector();
    acc = new PVector();
    exploded = false;
  }
  
  void behaviours(){
   this.arrive(this.acttarget);
  }
  
  void update(){
    if (exploded){
      this.vel.add(random(-0.4,0.4),random(-0.4,0.4));
    }
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    this.acc.mult(0);
  }
  
  void arrive(PVector target){
    PVector desired = PVector.sub(target,this.pos);
    float d = desired.mag();
    float speed = this.maxSpeed;
    if (d < 100){
     speed = map(d,0,100,0,this.maxSpeed); 
    }
    desired.setMag(speed);
    PVector steering = PVector.sub(desired,this.vel);
    steering.limit(this.maxForce);
    this.acc.add(steering);
  }
  
  void show(){
    rect(this.pos.x,this.pos.y,1,1);
  }
  
  void explode(){
    this.acttarget = new PVector(random(0,height),random(0,width));
    exploded = true;
  }
  
  void complete(){
    this.acttarget = this.target;
    exploded = false;
  }
}
