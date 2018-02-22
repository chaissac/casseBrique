class Balle {
  PVector p, v;
  float r;
  public Balle(float x, float y, float a) {
    p= new PVector(x, y);
    v= new PVector();
    r=height/(3*tailleY);
    v= PVector.fromAngle(a).mult(r/4);
  }
  public void trace() {
    fill(255);
    ellipse(p.x, p.y, r, r);
  }
  public boolean bouge(Raquette ra) {
    p.add(v);
    p.x=constrain(p.x,r,width-r);
    p.y=constrain(p.y,r,height-r);
    if (p.x<=r || p.x>=width-r) v.x=-v.x;
    if (p.y<=r || p.y>=height-r) v.y=-v.y;
    if ((abs(p.y-ra.y)<r+2) && (abs(p.x-ra.x)<ra.l/2)) {
      p.sub(v);
      v.y=-v.y;
      v.rotate(map(p.x-ra.x,-ra.l/2,ra.l/2,-1,1));
      p.add(v);
    }
    return (p.y<height-r);
  }
  public void collision(Brique[] br) {
    for(Brique b:br) {
      
    }
  }
}