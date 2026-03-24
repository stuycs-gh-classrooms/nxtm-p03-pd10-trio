class FixedOrb extends Orb
{

  /**
    Takes the  constructor of orb, and specifically sets the fixed orb to be red. 
   */
  FixedOrb(float x, float y, float s, float m)
  {
    super(x, y, s, m, int (random( -10, 10))); //fixed orb (earth) will have no charge 
    c = color(255, 0, 0);
  }

  /**
   Takes the default constructor of orb, and specifically sets the fixed orb to be red. 
   */
  FixedOrb()
  {
    super();
    c = color(255, 0, 0);
  }

  /**
  ovverides the superclass, so that the orb doesn't move. 
   */
  void move(boolean bounce)
  {
    //do nothing
  }
  
  void display ()
  {
    noStroke();
    fill(c);
    circle(center.x, center.y, bsize);
    fill(255);
    if (charge == Positive)
    {   
      textAlign(CENTER,CENTER);
      textSize (int (bsize / 2));
      text ("+", center.x, center.y);
    }
    if (charge == Negative)
    {
      textAlign(CENTER,CENTER);
      textSize (int (bsize / 2));
      text ("-", center.x, center.y);
    }
    //text(mass, center.x, center.y);
  }//display
}//fixedOrb
