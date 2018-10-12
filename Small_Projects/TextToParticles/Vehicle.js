function Vehicle(x,y){
  this.pos = createVector(random(width),random(height));
  this.target = createVector(x,y);
  this.actTarget = createVector(x,y);
  this.vel = createVector();
  this.acc = createVector();
  this.exploded = false;
  this.maxSpeed = 10;
  this.maxForce = 1;
}

Vehicle.prototype.behaviors = function () {
  this.arrive(this.actTarget);
}

Vehicle.prototype.update = function(){
  this.pos.add(this.vel);
  this.vel.add(this.acc);
  this.acc.mult(0);
}

Vehicle.prototype.arrive = function(target){
  var desired = p5.Vector.sub(target,this.pos);
  var d = desired.mag();
  var speed = this.maxSpeed;
  if (d < 100){
    speed = map(d,0,100,0,this.maxSpeed);
  }
  desired.setMag(speed);
  var steering = p5.Vector.sub(desired,this.vel);
  steering.limit(this.maxForce);
  this.acc.add(steering);
}

Vehicle.prototype.show = function(){
  stroke(255);
  strokeWeight(8);
  point(this.pos.x,this.pos.y);
}

Vehicle.prototype.explode = function(){
    this.actTarget = createVector(random(width),random(height));
    this.exploded = true;
}
