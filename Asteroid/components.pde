class Position {int x, y;}
class Object extends Position
{
  Collision collision;
  Object(){collision = new Collision(this);}
}
class Collision
{
  ArrayList<Shape> shapeList = new ArrayList<Shape>();
  void addShape(int x, int y, int sX, int sY) {shapeList.add(new Box(x, y, sX, sY));}
  void addShape(int x, int y, int r) {shapeList.add(new Bubble(x, y, r));}
  void addShape(int x, int y) {shapeList.add(new Point(x, y));}
  void show(){for (Shape i : shapeList) i.show();}//funskjon som viser Collision shapes.
  boolean check(Shape shape)
  {
    boolean a = false;
    for (Shape i : shapeList) if (i.check(shape)) a=true;
    return a;
  }
  boolean check(int x, int y)
  {
    boolean a = false;
    for (Shape i : shapeList) if (i.check(x, y)) a=true;
    return a;
  }
  
  Position object;
  Collision(Position position)
  {
    object = position;
  }
//======================================== - ========================================//
  abstract class Shape 
  {
    int x, y, offsetX, offsetY;
    Shape(int x, int y)
    {
      offsetX = x - object.x;
      offsetY = y - object.y;
    }
    void update() 
    {
      x = object.x+offsetX;
      y = object.y+offsetY;
    }
    boolean check(Shape shape)
    {
      print("Collision detection error. Collision between these two shapes isn't implemented. ");
      return false;
    }
    abstract boolean check(int x, int y);
    abstract void show();
  }
//======================================== - ========================================//  
  class Box extends Shape {int sX, sY;
    Box(int x, int y, int sX, int sY){super(x, y);this.x=x;this.y=y;this.sX=sX/2;this.sY=sY/2;}
    boolean check(Box b){return x+sX>=b.x-b.sX&&x-sX<=b.x+b.sX&&y+sY>=b.y-b.sY&&y-sY<=b.y+b.sY;}
    boolean check(Point b) {return x+sX>=b.x&&x-sX<=b.x&&y+sY>=b.y&&y-sY<=b.y;}
    boolean check(int x, int y){return this.x+this.sX>=x&&this.x-this.sX<=x&&this.y+this.sY>=y&&this.y-this.sY<=y;}
    void show(){rectMode(CENTER);rect(x, y, sX, sY);}
  }
  class Bubble extends Shape{int r;
    Bubble(int x, int y, int r)
    {super(x, y);this.x=x;this.y=y;this.r=r;}
    boolean check(int x, int y){return false;}
    void show(){ellipse(x, y, r, r);}
  }
  class Point extends Shape{
    Point(int x, int y)
    {super(x, y);this.x=x;this.y=y;}
    boolean check(int x, int y){return false;}
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
