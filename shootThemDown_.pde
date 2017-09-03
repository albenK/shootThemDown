/* CREATOR: Alben Kalambukadu
   DATE CREATED: 7/6/2015
   EMAIL: albenk234@gmail.com
   PROJECT: SHOOT THEM DOWN
*/

/*-------------------------------- SHOOT THEM DOWN ---------------------------------------------------------------------- */
import java.io.FileNotFoundException;
// Declare variables
private Spaceship spaceship;
private Enemies enemies;
private float enemySpeed;
private Bullet bullet;
private boolean gameIsRunning;
private boolean displayTheMenu;
private int sizeX = 500;
private int sizeY = 500;
private ArrayList <Bullet> bullets = new ArrayList <Bullet>();
private ArrayList <Enemies> listEnemies = new ArrayList <Enemies>();
private mainMenu theMainMenu;
private int score;
private String highScore;
private String[] highScoreList;
public boolean upArrowKeyIsPressed,leftArrowKeyIsPressed,rightArrowKeyIsPressed;
public boolean powerUpActivate;
// Initialize variables
void setup()
  {
    frameRate(60);
    size(sizeX, sizeY);
    //background = loadImage("earth.jpg");
    spaceship = new Spaceship();
    //enemies = new Enemies();
    enemySpeed = 6;
    bullet = new Bullet();
    score = 0;
    highScoreList = new String[1];
    theMainMenu = new mainMenu();
    displayTheMenu = true;
    upArrowKeyIsPressed = false;
    leftArrowKeyIsPressed = false;
    rightArrowKeyIsPressed = false;
    powerUpActivate = false;
    gameIsRunning = false;
}
  
//Run program
void draw()
  {
    background(255);
    if(necessaryFilesAreHere()) // check if files are in directory.
      {
        if(gameIsRunning)
          {
//            println("left: "+spaceship.leftArrowKeyIsPressed
//            +" right: "+spaceship.rightArrowKeyIsPressed+
//            " up: "+spaceship.upArrowKeyIsPressed+" END ");}
            if(frameCount % 45 == 0) {listEnemies.add(new Enemies(enemySpeed));} // add new enemies to collection.
            startPlayingGame();
          }
        else if(!gameIsRunning && !displayTheMenu) // display game over message and score.
        {
           // println("its game over!!!!");
            displayGameOverMessage();
          }
          else // display the main menu.
          {
           theMainMenu.displayMainMenu();
          } 
        }
    else // game files are missing, so display error message.
      { 
        displayErrorMessage();
      }
  }
  public void resetGame()
  {
    listEnemies.clear();
    bullets.clear();
    upArrowKeyIsPressed = false;
    leftArrowKeyIsPressed = false;
    rightArrowKeyIsPressed = false;
    powerUpActivate = false;
    score = 0;
  }
  private boolean necessaryFilesAreHere() // method to make sure files are in directory.
  {
    try
    {
      getHighScore();
    }
    catch(Exception e) // if game files are missing, then return false;
    {
      return false;
    }
    return true;
  }
  
  private void displayErrorMessage() // method to display error message.
  {
    textSize(15);fill(255,0,0);text(" ERROR: ONE OF THE GAME FILES IS MISSING :(",(width/4)-50,height/4);
    text("PLEASE DOWNLOAD THE GAME AGAIN FROM WEBSITE.",(width/4)- 50,(height/4) + 50);
  }
  
  private String getHighScore() // method to return the current high score.
  {
    String[] highScoreArray = loadStrings("data/highscore(2).cdt");
    return highScoreArray[0];
  }
  
  private void updateHighScore(int thisScore) // method to update the high score.
    {
      highScoreList[0] = str(thisScore);
      saveStrings("data/highscore(2).cdt",highScoreList);
    }
    
  void keyPressed()
    {
      if(gameIsRunning && !displayTheMenu)
      {
        if(key == CODED && keyCode == UP) 
        {
          upArrowKeyIsPressed = true;
        }
        else if(key == CODED && keyCode == LEFT)
        {
          leftArrowKeyIsPressed = true;
        }
        else if(key == CODED && keyCode == RIGHT)
        {
          rightArrowKeyIsPressed = true;
        }
      }
      
      else if(keyCode == ENTER && !gameIsRunning && !displayTheMenu) 
      { 
        gameIsRunning = true;
        resetGame();
      }
      else if(!gameIsRunning && displayTheMenu)
      {
        theMainMenu.checkForMainMenuOptionChanges(); 
        if(theMainMenu.getPlayerSelection() == "PLAY" && keyCode == ENTER)
        {
          gameIsRunning = true;
          displayTheMenu = false;
        }
        if(theMainMenu.getPlayerSelection() == "EXIT" && keyCode == ENTER) 
        {
          exit(); // exits the program..
        }
      }
    }
    
  void keyReleased()
  {
    if(key == CODED && gameIsRunning && !displayTheMenu) //just double checking..
    {
      if(keyCode == UP)
      {
        upArrowKeyIsPressed = false;
      }
      if(keyCode == LEFT)
      {
        leftArrowKeyIsPressed = false;
      }
      if(keyCode == RIGHT)
      {
        rightArrowKeyIsPressed = false;
      }
    }
  
  }
 private void displayGameOverMessage() // method to display game over and score.
 {
   textSize(30);
   text("GAME OVER!",(width/2) - 100, (height/4)/2);
   textSize(20);
   fill(0);
   text("YOUR SCORE IS: "+score,(width/2) - 100,height/4);
   text("THE HIGH SCORE ON THIS PC IS: "+getHighScore(),(width/2) - 170, height/3);
   fill(255,0,0);
   text("(Press the ENTER key to restart)", (width/2) - 150,height/2);
 }
 
 public void checkForSpaceShipMovement()
 {
   if(leftArrowKeyIsPressed)
   {
     spaceship.moveSpaceShipLeft();
     if(spaceship.spaceshipXposition < 20) //ship cannot go past left side.
     {
       spaceship.spaceshipXposition = width;
     }
   }
   else if(rightArrowKeyIsPressed)
   {
     spaceship.moveSpaceShipRight();
     if(spaceship.spaceshipXposition > width-20) //ship cannot go past right side.
     {
       spaceship.spaceshipXposition = 0;
     }
   }
   else if(upArrowKeyIsPressed)
   {
     spaceship.loadBullet(); // add new bullet to collection.
   }
   if(powerUpActivate)
   {
     if(leftArrowKeyIsPressed && upArrowKeyIsPressed)
     {
       //spaceship.moveSpaceShipLeft();
       spaceship.loadBullet();
     }
     if(rightArrowKeyIsPressed && upArrowKeyIsPressed)
     {
       //spaceship.moveSpaceShipRight();
       spaceship.loadBullet();
     }  
   }
   
 }
 public void displayPowerUpNotification()
 {
   textSize(15);
   fill(0,0,255);
   text("POWER UP ACTIVE!",width/2,(height/2)+20);
 }
//create function to run the game.
private void startPlayingGame()
  {
    highScore = getHighScore();
    spaceship.displayShip();
    checkForSpaceShipMovement();
    //spaceship.moveShip();
    fill(0);
    textSize(30);
    text("SCORE: "+score,width/2,height/2); // dislpay current score.
    if(score > int(highScore)) {updateHighScore(score);} // update the high score.
    if(score > 0 && score % 100 == 0 && score % 200 != 0)
    {
      powerUpActivate = true;
    }
    else if(score % 200 == 0)
    {
      powerUpActivate = false;
    }
    if(powerUpActivate)
    {
      displayPowerUpNotification();
    }

    for(int i = bullets.size() - 1; i > -1; i--) // display and move bullets.
      {
        Bullet b = bullets.get(i);
        b.displayBullet();
        b.moveBullet();
        if(b.bulletGoesOffScreen()) {bullets.remove(i);} // remove bullets if off screen.
      }
    
    
    for(int i = listEnemies.size() - 1; i > -1; i--) // display and move enemies.
      {
        Enemies e = listEnemies.get(i);
        e.displayEnemies();
        e.moveEnemies();
        if(e.enemyPassesBottomPartOfScreen()) // player looses game, so clear everything.
        {
          listEnemies.clear();
          bullets.clear();
          gameIsRunning = false;
          break;
        }
      }   
    
    for(int i = bullets.size() - 1; i > -1; i--)
      {
        Bullet b = bullets.get(i);
        for(int j = listEnemies.size() - 1; j > -1; j--)
          {
            Enemies e = listEnemies.get(j);
            //if bullet hits enemy, then remove that enemy and bullet.
            if(b.bulletXposition >= e.enemyXposition-25 && b.bulletXposition <= e.enemyXposition+25 && b.bulletYposition <= e.enemyYposition + 25 && b.bulletYposition >= e.enemyYposition - 25)
              {
                bullets.remove(i);
                listEnemies.remove(j);
                score += 5;
                break;
              }
          }  
      }
  }

        
     

