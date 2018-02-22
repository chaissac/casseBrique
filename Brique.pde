class Brique {
  PVector pos;
  int t,hit;
  float h,l;
  int[] hits = {0,0,3,2,1,1,1,1};
  color[] col = {#000000,#909090,#B0B000,#D0A000,#2020D0,#20D020,#D020D0,#F0F0F0}; 
  public Brique(int _x, int _y, int _t) {
    pos = new PVector(_x,_y);
    t = constrain(_t,0,7);
    l = (width*.90)/tailleX;
    h = (height*.90)/tailleY;
  }
  public void trace() {
    fill(col[t],255-hit*85);
    rect(l*pos.x+width*.05,h*pos.y+height*.05,l-2,h-2);
  }
}