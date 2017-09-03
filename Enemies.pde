/* CREATOR: Alben Kalambukadu
   DATE CREATED: 7/6/2015
   EMAIL: albenk234@gmail.com
   PROJECT: SHOOT THEM DOWN
*/

// Make new class for enemies.
class Enemies
  {
    private float enemyXposition,enemyYposition,enemyWdth,enemyHght,enemyYspeed; // declare variables.
    public Enemies(float eSpeed) // constructor.
      {
        enemyXposition = random(50,width - 51);
        enemyYposition = 25;
        enemyWdth = 50;
        enemyHght = 50;
        enemyYspeed = eSpeed;
      }
      
    private void displayEnemies() // create function to display enemy.
      {
        rectMode(CENTER);
        fill(255,0,0);
        noStroke();
        rect(enemyXposition,enemyYposition,enemyWdth,enemyHght); // ellipse or rectangle.
      }
      
    private void moveEnemies() // creat function to move enemies.
      {
        enemyYposition += enemyYspeed;
      }
      
    private boolean enemyPassesBottomPartOfScreen() // create function to check enemies, if they go out of screen.
      {
        if(enemyYposition >= height + 25)
          {
            return true;
          }
        return false;
      }
  }
