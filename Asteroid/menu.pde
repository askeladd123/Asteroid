void menu()
{
  start.show();
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
