/* CREATOR: Alben Kalambukadu
   DATE CREATED: 7/6/2015
   EMAIL: albenk234@gmail.com
   PROJECT: SHOOT THEM DOWN
*/

//create class for spaceship.  
class Spaceship
  {
    private float spaceshipXposition,spaceshipYposition,xSpeed; // declare variables.
    
    public Spaceship() // constructor.
      {
        spaceshipXposition = width/2;
        spaceshipYposition = height - 20;
        xSpeed = 6;
        upArrowKeyIsPressed = false;
        leftArrowKeyIsPressed = false;
        rightArrowKeyIsPressed = false;
      }
        
    private void displayShip() // create function to display the ship.
      {
        fill(0);
        noStroke();
        triangle(spaceshipXposition-20,spaceshipYposition+20,spaceshipXposition+20,spaceshipYposition+20,spaceshipXposition,spaceshipYposition-20);
      }
   public void moveSpaceShipRight()
   {
     spaceshipXposition += xSpeed;
   }
   
   public void moveSpaceShipLeft()
   {
     spaceshipXposition -= xSpeed;
   }
    private void moveShip() // create function to move the ship.
      {
//        if(keyPressed)
//          {
//            if(keyCode == RIGHT) // move ship right.
//              {
//                rightArrowKeyIsPressed = true;
//                leftArrowKeyIsPressed = false;
//                spaceshipXposition += xSpeed;
//                if(spaceshipXposition > width-20) //ship cannot go past right side.
//                  {
//                    spaceshipXposition = 0;
//                  }
//              }
//            if(keyCode == LEFT) // move ship left.
//              {
//                leftArrowKeyIsPressed = true;
//                rightArrowKeyIsPressed = false;
//                spaceshipXposition -= xSpeed;
//                  if(spaceshipXposition < 20) //ship cannot go past left side.
//                    {
//                      spaceshipXposition = width;
//                    }
//              } 
//          }
      }
      
    private void loadBullet() // create function to add new bullets to bullets collection.
      {  
        
        bullets.add(new Bullet());
      }
  } 
     
