PImage image;
ArrayList<Vehicle> vehicles = new ArrayList();
boolean takeApart = false;
int i = 0;
int counter = 0;
int explodedCounter = 0;

void setup(){
  size(1000,600);
  image = loadImage("Banner_woods.png");
  for(int y = 0; y < image.height - 2; y++){
    y += 2;
   for(int x = 0; x < image.width - 2; x++){
     x += 2;
    int index = x + y * image.width;
    color pix = image.pixels[index]; 
    float count = 0;
    count += red(pix);
    count += green(pix);
    count += blue(pix);
    if(count < 200){
     Vehicle v = new Vehicle(x,y);
     vehicles.add(v); 
    }
   }
  }
  print(vehicles.size());
}

void draw(){
  background(255);
  fill(0);
  for (Vehicle v : vehicles){
    v.behaviours();
    v.update();
    v.show();
    
  }
  if (takeApart){
    takeApart(10);
  }
  counter++;
  println(frameRate);
  
  
}

void keyPressed(){
  if (key == CODED){
   if (keyCode == LEFT){
     for (Vehicle v : vehicles){
       v.explode();
     }
   }
   if (keyCode == RIGHT){
     for (Vehicle v : vehicles){
       v.complete();
     }
   }
   if (keyCode == UP){
     takeApart = true;
   }
   if (keyCode == DOWN){
    takeApart = false; 
   }
  }
}

void takeApart(int perFrame){
  if (counter % perFrame == 0){
      int rnd = (int) random(0,vehicles.size());
      if (!vehicles.get(rnd).exploded){
        vehicles.get(rnd).explode();
        explodedCounter++;
      }
      else if (explodedCounter == vehicles.size()){
       return; 
      }
      else{
        takeApart(perFrame);
      }
    }
}
