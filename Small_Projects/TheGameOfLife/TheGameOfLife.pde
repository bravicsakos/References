ArrayList<Creature> listOld;
ArrayList<Creature> listNew;
int cols;
int rows;
int res = 5;
int time = 1;

void setup(){
  size(600,600);
  cols = width/res;
  rows = height/res;
  listOld = new ArrayList();
  listNew = new ArrayList();
  for(int i = 0; i < cols*rows; i++){
    PVector v = toCoordinate(i,cols);
    Creature c;
    c = new Creature((int)v.x,(int)v.y,true,res);
    listOld.add(c);
    listNew.add(c);
  }
}

void draw(){
  frameRate(120);
  background(0);
  listNew = new ArrayList();
  for(int i = 0; i < cols*rows; i++){
    PVector v = toCoordinate(i,cols);
    Creature c = new Creature((int)v.x,(int)v.y,res);
    listNew.add(c);
  }
  for (int i = 0; i < listOld.size(); i++){
    listOld.get(i).show(time);
    listOld.get(i).live();
    listOld.get(i).die();
  }
  for (int i = 0; i < listOld.size(); i++){
    int neighbours = countNeighbours(i);
    if (listOld.get(i).isAlive && neighbours < 2){
      listNew.get(i).isAlive = false;
      listNew.get(i).wasAlive = true;
    }
    else if (listOld.get(i).isAlive && neighbours > 3){
      listNew.get(i).isAlive = false;
      listNew.get(i).wasAlive = true;
    }
    else if (!listOld.get(i).isAlive && neighbours == 3){
      listNew.get(i).isAlive = true;
    }
    else {
      listNew.set(i,listOld.get(i));
    }
  }
  listOld = listNew;
  time++;
}

PVector toCoordinate(int index, int colsS){
  PVector v = new PVector();
  v.y = index / colsS;
  v.x = index - ((int)(index / colsS)*colsS);
  return v;
}

int toIndex(int x, int y,int colsS){
  return x + y * colsS;
}

int countNeighbours(int index){
  int count = 0;
  PVector v = toCoordinate(index,cols);
  int x = (int) v.x;
  int y = (int) v.y;
  for (int i = -1; i <= 1; i++){
   for (int j = -1; j <= 1; j++){
     if (x + i >= 0 && x + i < cols && y + j >= 0 && y + j < rows){
       if(listOld.get(toIndex(x + i,y + j,cols)).isAlive){
         count++;
       }
     }
   }
  }
  return listOld.get(index).isAlive == true ? count -1 : count;
}

void mouseDragged(){
  int index = toIndex(mouseX / res,mouseY / res,cols);
  listOld.get(index).isAlive = true;
}
