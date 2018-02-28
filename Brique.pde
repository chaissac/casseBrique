class Brique {
  PVector pos;
  int t, hit;
  float h, l;
  int[] hits = {-2,3,1,1, 1, 1, 1, 1};
  color[] col = {#F0F000, #FFFFFF, #B0B000, #D0A000, #2020D0, #20D020, #D020D0, #F000F0}; 
  public Brique(int _x, int _y, int _t) {
    l = (width*.90)/tailleX;
    h = (height*.90)/tailleY;
    pos = new PVector(l*_x+width*.05+1, h*_y+height*.05+1);
    l-=2;
    h-=2;
    t = constrain(_t, 0, 7);
    hit = hits[t];
  }
  public boolean trace() {
    if (hit!=0) {
      noStroke();
      fill(col[t]);
      rect(pos.x, pos.y, l, h);
    }
    return (hit!=0);
  }
  public void hit() {
    hit--;
    if (hit==0 && random(100)<20) bonus.add(new Bonus(pos.x,pos.y));
    if (hit==-1) hit=0;
  }
}