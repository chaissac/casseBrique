class Raquette { 
  float x,y,l,h;
  boolean collante;
  public Raquette() {
    x = width/2;
    l=width/tailleX;
    h=height/(2*tailleY);
    y=height*.9;
    collante=false;
  }
  void trace() {
    x=min(width,max(0,mouseX));
    fill(#00A0C0);
    noStroke();
    rect(x-l/2,y,l,h);
  }
}