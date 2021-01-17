color green = color(50, 240, 70);
color grey = color(200, 200, 200);
color white = color(255, 255, 255);

class Button extends Object
{
  String title;
  int offsetX, offsetY;
  int frameWidth = 200, frameHeight = 50;
  Button(String title,int offsetX, int offsetY)
  {
    this.title=title;
    this.offsetX=offsetX;
    this.offsetY=offsetY;
    collision.addShape(width/2 + offsetX, height/2 + offsetY, frameWidth, frameHeight);
  }
  boolean collided;
  void show()
  {
    collided = collision.check(mouseX, mouseY);
    if (collided) title(white);
    else title(grey);
    frame();
  }
  void frame() //rectMode(CENTER) står i Setup(), unødvendig å kjøre den hvert tick
  {
    noFill();
    stroke(green);
    strokeWeight(10);
    rect(width/2 + offsetX, height/2 + offsetY, frameWidth, frameHeight);
  }
  void title(color fill){
    fill(fill);
    textSize(32);
    text(title, width/2 + offsetX-42, height/2 + offsetY + 8);
  }
}
