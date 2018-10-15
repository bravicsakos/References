var gamemap;
var j = 0;

function setup(){
  createCanvas(200,200);
  gamemap = createImage(width,height);
  gamemap.loadPixels();
  for (var i = 0; i < gamemap.pixels.length; i += 4){
    var j = floor(random(4));
    switch (j) {
      case 0:
        gamemap.pixels[i] = 0;
        gamemap.pixels[i+1] = 255;
        gamemap.pixels[i+2] = floor(random(256));
        gamemap.pixels[i+3] = 255;
        break;
      case 1:
        gamemap.pixels[i] = 255;
        gamemap.pixels[i+1] = floor(random(256));
        gamemap.pixels[i+2] = 0;
        gamemap.pixels[i+3] = 255;
        break;
      case 2:
        gamemap.pixels[i] = 0;
        gamemap.pixels[i+1] = floor(random(256));
        gamemap.pixels[i+2] = 255;
        gamemap.pixels[i+3] = 255;
        break;
      case 3:
        gamemap.pixels[i] = floor(random(256));
        gamemap.pixels[i+1] = 255;
        gamemap.pixels[i+2] = 0;
        gamemap.pixels[i+3] = 255;
        break;
      default:

    }

    gamemap.pixels[i+3] = 255;

  }
  gamemap.updatePixels();
}

function draw(){
  frameRate(120);
  image(gamemap,0,0);
  gamemap.loadPixels();
  for (var j = 0; j < 10; j++){
    for (var i = 0; i < gamemap.pixels.length; i += 4){
      rendez3(i);
    }
  }
  gamemap.updatePixels();
}
function rendez3(index){
  var red1 = gamemap.pixels[index];
  var red2 = gamemap.pixels[index + 4];
  var green1 = gamemap.pixels[index + 1];
  var green2 = gamemap.pixels[index + 5];
  var blue1 = gamemap.pixels[index + 2];
  var blue2 = gamemap.pixels[index + 6];

  var value1 = getValue(index);
  var value2 = getValue(index + 4);
  if (value1 < value2) {
    gamemap.pixels[index] = red2;
    gamemap.pixels[index + 1] = green2;
    gamemap.pixels[index + 2] = blue2;
    gamemap.pixels[index + 4] = red1;
    gamemap.pixels[index + 5] = green1;
    gamemap.pixels[index + 6] = blue1;
  }
}

function getValue(index){
  var red = gamemap.pixels[index];
  var green = gamemap.pixels[index + 1];
  var blue = gamemap.pixels[index + 2];
  var value = 0;

  if (red === 255 && blue === 0){
    value = green;
  }
  else if (green === 255 & blue === 0){
    value = green + 255 - red;
  }
  else if (red === 0 && green === 255){
    value = green + 255 + blue;
  }
  else if (red === 0 && blue === 255){
    value = 765 + 255 - green;
  }
  return value;
}

function mousePressed(){
  console.log(gamemap.get(mouseX,mouseY));

}
