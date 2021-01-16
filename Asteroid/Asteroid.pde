Button b;

void setup() 
{
  size(800, 800);
  surface.setTitle("Asteroid");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  b = new Button("bullet.png", State.GAME);
}
void draw()
{
  background(0);
  
  switch(gameState)
  {
  case GAME: //======================================== - ========================================//
    
    
    break;
  case QUIT: //======================================== - ========================================//
    
    
    break;
  case MENU: //======================================== - ========================================//
    b.show();
    rect(0, 0, 100, 100);
    rectMode(CENTER);
    rect(50, 150, 100, 100);
    rectMode(CORNER);
    
    break;
  case OPTIONS: //===================================== - ========================================//
    
    
    break;
  default:
    gameState = State.MENU;
  }
}
