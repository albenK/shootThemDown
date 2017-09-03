public class mainMenu
{
  private String[] mainMenuOptions;
  private String play,instructions,exit; // menu options;
  private String playerSelection,titleOfGame;
  private int numberOfOptionsInMainMenu,currentlySelected,R,G,B;
  mainMenu()
  {
    titleOfGame = "SHOOT THEM DOWN";
    numberOfOptionsInMainMenu = 3;
    mainMenuOptions = new String[numberOfOptionsInMainMenu];
    play = "PLAY";
    instructions = "INSTRUCTIONS";
    exit = "EXIT";
    playerSelection = play;
    mainMenuOptions[0] = play;
    mainMenuOptions[1] = instructions;
    mainMenuOptions[2] = exit;
    currentlySelected = 0;
  }
  
  public void displayMainMenu()
  {
    for(int index = 0; index < mainMenuOptions.length; index++)
    {
      if(currentlySelected == index)
      {
        R = 255; G = 0; B = 0;
        playerSelection = mainMenuOptions[index];
      }
      else
      {
        R = 0; G = 0; B = 0;
      }
      fill(R,G,B);
      textSize(50);
      text(mainMenuOptions[index],width/4,(height/2)+(index*50));
      textSize(30);
      fill(255,0,0);
      text(titleOfGame,width/4,height/4);
    }
  }
  
  public void checkForMainMenuOptionChanges() // checks for currently selected..
  {
    if(keyPressed && keyCode == DOWN)
    {
      currentlySelected += 1;
      if(currentlySelected >= mainMenuOptions.length) {currentlySelected = 0;}
    }
    else if(keyPressed && keyCode == UP)
    {
      currentlySelected -= 1;
      if(currentlySelected < 0){currentlySelected = mainMenuOptions.length - 1;}
    }
  }
  
  public String getPlayerSelection() // returns player selection...
  {
    return playerSelection;
  }
}
