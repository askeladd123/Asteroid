class Button
{
  Collision collision = new Collision();
  Picture pic;
  Button(String name, State screen)
  {
    pic = new Picture(name);
  }
  void show() {pic.show(width/2, height/2, 400);}
}
