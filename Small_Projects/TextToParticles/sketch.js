var font;
var vehicles = [];
var addBehavior = false;
var isNew = false;
var offset = 0;
var lastPos = 0;
var translateX;
var translateY;
var isPressed = false;

function preload(){
  font = loadFont('ProcessingSansPro-Regular.ttf');
}

function setup() {
  createCanvas(1300,800);
  background(0);
  textFont(font);
  textSize(128);
  translateX = 50;
  translateY = 300/2;
}

function draw() {
  background(0);
  stroke(255);
  for (var i = 0; i < vehicles.length; i++){
    if (addBehavior){
      vehicles[i].behaviors();
    }
    vehicles[i].update();
    vehicles[i].show();
  }
}

function keyPressed() {
  if(keyCode === UP_ARROW){
    isNew = true;
  }
  else  if(keyCode === DOWN_ARROW){
    for(var i = 0; i < vehicles.length; i++){
     vehicles[i].exploded = false;
     vehicles[i].actTarget = vehicles[i].target;
    }
  }
  else if(keyCode === LEFT_ARROW){
    for(var i = 0; i < vehicles.length; i++){
     vehicles[i].explode();
    }
  }
  else if (keyCode === RIGHT_ARROW){
    addBehavior = true;
  }
  else if (keyCode === ENTER){
    offset = 0;
    translateY += 120;
  }

}

function keyTyped(){
  if ((key >= 'a' && key <= 'z') || key === '<' || key === '3'){
    isPressed = true;
     if (isNew){
       offset = 0;
       lastPos = 0;
       isNew = false;
     }
       textSize(textsize);
       var points = font.textToPoints("" + key.toUpperCase(),0,0);
       for (var i = 0; i < points.length; i++){
         var v = new Vehicle(points[i].x + translateX + offset,points[i].y + translateY);
         if(lastPos < vehicles.length){
           vehicles[lastPos].actTarget = v.actTarget;
           vehicles[lastPos].target = v.target;
         }
         else{
           vehicles.push(v);
         }
         lastPos++;
       }
       offset += 100;
   }
   else if (key === '.'){
     for (var i = vehicles.length-1; i >= lastPos;i--){
       vehicles.pop(i);
     }
    }
  else if (key === ' '){
      offset += 100;
  }

}
