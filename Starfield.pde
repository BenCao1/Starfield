Particle [] stars;
void setup()
{
	size(500, 500);
  background(0);
  stars = new Particle[3000];
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Particle();
  }
  stars[0] = new OddballParticle();
  stars[1] = new OddballParticle();
  stars[2] = new OddballParticle();
}
void draw()
{
  background(0);
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].show();
    stars[i].move();
  }
}

void mousePressed() {
  setup();
}

class Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor;
  Particle() {
    mySpeed = (Math.random() * 15);
    myAngle = (Math.random() * 4) * (Math.PI);
    myX = 250;
    myY = 250;
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255)); 
  }  
  public void move() {
  myX = myX + (Math.cos(myAngle)) * (mySpeed);
  myY = myY + (Math.sin(myAngle)) * (mySpeed);
  if (myX > 1000 || myY > 1000 || myX < -500 || myY < -500)
    {
      myX = myY = 250;
    }
  }  
  public void show() {
    fill(myColor);
    noStroke();
    rect((int)myX,(int)myY,5,5);
  }


}  



class OddballParticle extends Particle//inherits from Particle
{
	OddballParticle() {
    myX = myY = 250;
  }
  
  void move() {
     myX += (int)(Math.random() * 3) - 1;
     myY += (int)(Math.random() * 3) - 1;
  }  
  
  void show() {
    fill(myColor);
    ellipse((int)myX,(int)myY,50,50);
  }
}  
