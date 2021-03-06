Button start, quit, menu, options, back;

void setup() 
{
  size(800, 800);
  rectMode(CENTER);
  surface.setTitle("Asteroid");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  start = new Button("start", 0, -80);
  quit = new Button("quit", 0, 80);
  menu = new Button("menu", 0, 0);
  options = new Button("options", 0, 0, -18);
  back = new Button("back", 0, 0);
}
void draw()
{
  background(0);
  //finite state machine
  switch(gameState)
  {
  case GAME:game();break;
  case MENU:menu();break;
  case OPTIONS:options();break;
  default:
    gameState = State.MENU;
  }
}
void mousePressed()
{
  //finite state machine
  switch(gameState)
  {
  case GAME:mousePressedGame();break;
  case MENU:mousePressedMenu();break;
  case OPTIONS:mousePressedOptions();break;
  default:
    gameState = State.MENU;
  }
}
void keyPressed()
{
  //finite state machine
  switch(gameState)
  {
  case GAME:mousePressedGame();break;
  case MENU:mousePressedMenu();break;
  case OPTIONS:mousePressedOptions();break;
  default:
    gameState = State.MENU;
  }
}
void keyReleased()
{
  keyReleasedGame();
}
