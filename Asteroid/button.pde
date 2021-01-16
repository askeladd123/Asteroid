class Button
{
  Collision collision = new Collision();
  Picture pic;
  Button(String name, State screen)
  {
    pic = new Picture(name);
  }
  void show() {pic.show(100, 100, 400);}
}
