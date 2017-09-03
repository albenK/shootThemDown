/* CREATOR: Alben Kalambukadu
   DATE CREATED: 7/6/2015
   EMAIL: albenk234@gmail.com
   PROJECT: SHOOT THEM DOWN
*/

// Create class for bullet, to shoot enemies.
class Bullet
  {
     private float bulletXposition, bulletYposition; // declare variables.
     private float bulletXspeed, bulletYspeed;
     
     public Bullet() // constructor.
      {
        bulletXposition = spaceship.spaceshipXposition;
        bulletYposition = spaceship.spaceshipYposition;
        bulletXspeed = 0;
        bulletYspeed = -5;
      }
      
     private void displayBullet()
      {
        strokeWeight(5);
        stroke(0);
        line(bulletXposition, bulletYposition + 5, bulletXposition,bulletYposition-5);
      } 
      
     private void moveBullet() // create function to move bullet up.
       {
          bulletYposition += bulletYspeed;
       }
        
     private boolean bulletGoesOffScreen() // create function to check bullets, if they go out of screen.
      {
        if(bulletYposition <= -10) {return true;}
        return false;
      }
  }

  
  
  
  
  
  
