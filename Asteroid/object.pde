class Collision
{
  ArrayList<Shape> shapeList = new ArrayList<Shape>();
  void addShape(int x, int y, int sX, int sY) {shapeList.add(new Box(x, y, sX, sY));}
  void addShape(int x, int y, int r) {shapeList.add(new Bubble(x, y, r));}
  void addShape(int x, int y) {shapeList.add(new Point(x, y));}
  void show(){for (Shape i : shapeList) i.show();}

  abstract class Shape 
  {
    boolean check(Shape shape)
    {
      print("Collision detection error. Collision between these two shapes isn't implemented. ");
      return false;
    }
    abstract void show();
  }
  class Box extends Shape {int x, y, sX, sY;
    Box(int x, int y, int sX, int sY){this.x=x;this.y=y;this.sX=sX;this.sY=sY;}
    boolean check(Box b){return x+sX>=b.x-b.sX&&x-sX<=b.x+b.sX&&y+sY>=b.y-b.sY&&y-sY<=b.y+b.sY;}
    boolean check(Point b) {return x+sX>=b.x&&x-sX<=b.x&&y+sY>=b.y&&y-sY<=b.y;}
    void show(){
      rect(x-sX, y-sY, sX*2, sY*2);
    }
  }
  class Bubble extends Shape{int x, y, r;
    Bubble(int x, int y, int r)
    {this.x=x;this.y=y;this.r=r;}
    void show(){ellipse(x, y, r, r);}
  }
  class Point extends Shape{int x, y;
    Point(int x, int y)
    {this.x=x;this.y=y;}
    void show()
    { //lager et kryss
      noStroke();
      translate(x, y);
      rotate(PI/4);
      rect(-2, -10, 4, 20);
      rotate(PI/2);
      rect(-2, -10, 4, 20);
      rotate(-3*PI/4);
      translate(-x, -y);
    }
  }
}
//======================================== - ========================================//
class Picture
{
  PImage image;
  boolean loaded = true;
  Picture(String name) 
  {    
    try {image = loadImage(name);}
    catch(Exception e) {loaded = false;print("Could not load image named: " + name + ". ");}
  }
  void show(int x, int y, int s) 
  {
    if (!loaded) return;
    image(image, x, y, s, s);
  }
}
