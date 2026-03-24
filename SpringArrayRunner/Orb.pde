class Orb
{

  //instance variables
  PVector center;
  PVector velocity;
  PVector acceleration;
  float bsize;
  float mass;
  color c;


  /**
   This is the default constructor that is called when no parameters are given for the orb constructor.
   */
  Orb()
  {
    bsize = random(10, MAX_SIZE);
    float x = random(bsize/2, width-bsize/2);
    float y = random(bsize/2, height-bsize/2);
    center = new PVector(x, y);
    mass = random(10, 100);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
  }


  /**
   This constructor takes 4 parameters, an x and y value for the center of the orb, a size for the orb, and a mass for the orb.
   It also instantuates the attirbutes of Velocity and Acceleration.
   */
  Orb(float x, float y, float s, float m)
  {
    bsize = s;
    mass = m;
    center = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
  }


  /**
   Moving method for each orb. This works by first adding to velocity, the acceleration value. Then adding said velocity to center, acting like real particle motion.
   Then it multiples acceleration by 0, because forces add to acceleartion every frame, so it's important that you reset acceleration.
   Also checks if bounce is true, if so then it will tell the orb to bounce off the walls using other methods.
   */
  void move(boolean bounce)
  {
    if (bounce) {
      xBounce();
      yBounce();
    }

    velocity.add(acceleration);
    center.add(velocity);
    acceleration.mult(0);
  }//move


  /**
   A method that takes a force, and divides it by the mass of the orb to find the acceleration (from F = ma), then adds said acceleration to the attributes.
   */
  void applyForce(PVector force)
  {
    PVector scaleForce = force.copy();
    scaleForce.div(mass);
    acceleration.add(scaleForce);
  }


  /**
   A method that returns the drag force by taking a parameter of a drag constant then applying the drag force formula.
   */
  PVector getDragForce(float cd)
  {
    float dragMag = velocity.mag();
    dragMag = -0.5 * dragMag * dragMag * cd;
    PVector dragForce = velocity.copy();
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }


  /**
   A method that returns the gravitioanl force between this orb and another orb, by taking a parameter of a gravitaional constant.
   */
  /*PVector getGravity(Orb other, float G)
   {
   float strength = G * mass*other.mass;
   //dont want to divide by 0!
   float r = max(center.dist(other.center), MIN_SIZE);
   strength = strength/ (r * r);
   PVector force = other.center.copy();
   force.sub(center);
   force.mult(strength);
   return force;
   }
   */

  PVector getGravity(Orb other, float G)
  {
    PVector force = PVector.sub(other.center, center); 
    float r = max (force.mag(), MIN_SIZE);
    force.normalize();
    float strength = G * mass * other.mass / (r * r);
    force.mult(strength);
    return force;
  }

  /**
   getSpring()
   
   This should calculate the force felt on the calling object by
   a spring between the calling object and other.
   
   The resulting force should pull the calling object towards
   other if the spring is extended past springLength and should
   push the calling object away from o if the spring is compressed
   to be less than springLength.
   
   F = kx (ABhat)
   k: Spring constant
   x: displacement, the difference of the distance
   between A and B and the length of the spring.
   (ABhat): The normalized vector from A to B
   */
  PVector getSpring(Orb other, int springLength, float springK)
  {
    PVector springForce = new PVector();
    springForce = PVector.sub (other.center, this.center); //sub finds the vector AB, which has to be B - A
    float x = springForce.mag() - springLength; //has to subtract springLength from the distance from a to B, since x is the distance the spring is stretched
    springForce.normalize();  //normalize to  get the unit vector
    springForce.mult (springK * x); // multiplies the unit vector by spring constant and displacement to find force.
    return springForce;
  }//getSpring


  /**
   Method that causes the orb to bounce of walls, by making sure the orb's position doesn't leave the bounds.
   If it does, then set the center of the orb to be within the bounds and then flip velcoity. Returns a boolean if it does exceed the bounds.
   */
  boolean yBounce()
  {
    if (center.y > height - bsize/2) {
      velocity.y *= -1;
      center.y = height - bsize/2;

      return true;
    }//bottom bounce
    else if (center.y < bsize/2) {
      velocity.y*= -1;
      center.y = bsize/2;
      return true;
    }
    return false;
  }//yBounce


  /**
   Method that causes the orb to bounce of walls, by making sure the orb's position doesn't leave the bounds.
   If it does, then set the center of the orb to be within the bounds and then flip velcoity. Returns a boolean if it does exceed the bounds.
   */
  boolean xBounce()
  {
    if (center.x > width - bsize/2) {
      center.x = width - bsize/2;
      velocity.x *= -1;
      return true;
    } else if (center.x < bsize/2) {
      center.x = bsize/2;
      velocity.x *= -1;
      return true;
    }
    return false;
  }//xbounce


  /**
   checks if this orb overlaps with another orb. If so return true.
   */
  boolean collisionCheck(Orb other)
  {
    return ( this.center.dist(other.center)
      <= (this.bsize/2 + other.bsize/2) );
  }//collisionCheck


  /**
   sets the color of the orb to be a color bewteen purple and black. The amount decides which color is favored when mixing the two.
   */
  void setColor()
  {
    color c0 = color(0, 255, 255);
    color c1 = color(0);
    /*
    Lerpcolor takes two colors and finds a color between the two colors
     */
    c = lerpColor(c0, c1, (mass-MIN_SIZE)/(MAX_MASS-MIN_SIZE));
  }//setColor


  //visual behavior
  void display()
  {
    noStroke();
    fill(c);
    circle(center.x, center.y, bsize);
    fill(0);
    //text(mass, center.x, center.y);
  }//display
}//Ball
