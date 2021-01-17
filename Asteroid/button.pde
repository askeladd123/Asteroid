color green = color(50, 240, 70);
color grey = color(200, 200, 200);
color white = color(255, 255, 255);

class Button extends Object
{
  String title;
  int offsetX, offsetY, titleShift=0;
  int frameWidth = 200, frameHeight = 50;
  boolean collided;
  Button(String title,int offsetX, int offsetY)
  {
    this.title=title;
    this.offsetX=offsetX;
    this.offsetY=offsetY;
    collision.addShape(0, 0, frameWidth, frameHeight);
  }
    Button(String title, int offsetX, int offsetY, int titleShift)
  {
    this.title=title;
    this.offsetX=offsetX;
    this.offsetY=offsetY;
    this.titleShift=titleShift;
    collision.addShape(0, 0, frameWidth, frameHeight);
  }
  void show()
  {
    updatePosition();
    collided = collision.check(mouseX, mouseY);
    if (collided) title(white);
    else title(grey);
    frame();
  }
  int x(){return width/2 + offsetX;}
  int y(){return height/2 + offsetY;}
  void updatePosition(){x = x();y = y();}
  void frame() //rectMode(CENTER) står i Setup(), unødvendig å kjøre den hvert tick
  {
    noFill();
    stroke(green);
    strokeWeight(4);
    rect(x, y, frameWidth, frameHeight);
  }
  void title(color fill){
    fill(fill);
    textSize(32);
    text(title, x - 38 + titleShift, y + 8);
  }
}
