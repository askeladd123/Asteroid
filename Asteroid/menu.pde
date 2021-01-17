void menu()
{
    start.collision.show();
    options.collision.show();
    quit.collision.show();
  start.show();
    start.collision.printTest();
    text("x: " + start.x + ", y: " + start.y + ". ", 20, 40);
    text("x: " + mouseX + ", y: " + mouseY + ". ", 20, 60);
  options.show();
  quit.show();
}
void mousePressedMenu()
{
  if (mouseButton == LEFT)
  {
    if (start.collided) gameState = State.GAME;
    if (options.collided) gameState = State.OPTIONS;
    if (quit.collided) quit();
  }  
}
void keyPressedMenu()
{
  
}
