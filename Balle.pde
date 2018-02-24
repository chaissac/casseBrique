class Balle {
  PVector p, v;
  float r;
  boolean collante;
  float dx;
  public Balle(float x, float y, float a) {
    p= new PVector(x, y);
    v= new PVector();
    r=height/(3*tailleY);
    v= PVector.fromAngle(a).mult(r/3);
    collante = true;
    dx=0;
  }
  public void trace() {
    noStroke();
    fill(255);
    ellipse(p.x, p.y, r, r);
  }
  public boolean bouge(Raquette ra) {
    if (collante) {
      p.x=ra.x+dx;
      p.y=ra.y-r;
      return true;
    }
    p.add(v);
    p.x=constrain(p.x, r, width-r);
    p.y=constrain(p.y, r, height-r);
    // p.x=mouseX;
    // p.y=mouseY;
    if (p.x<=r || p.x>=width-r) v.x=-v.x;
    if (p.y<=r || p.y>=height-r) v.y=-v.y;
    renvoi(ra);
    return (p.y<height-r);
  }
  public boolean renvoi(Raquette ra) {
    PVector pv = new PVector(min(max(p.x, ra.x-ra.l/2), ra.x+ra.l/2), min(max(p.y, ra.y), ra.y+ra.h));
    float d = PVector.sub(p, pv).mag()-r;
    if (d<0) {
      if (int(pv.x)==int(ra.x-ra.l/2) || int(pv.x)==int(ra.x+ra.l/2)) v.x=-v.x;
      if (int(pv.y)==int(ra.y) || int(pv.y)==int(ra.y+ra.h)) v.y=-v.y;
      p.sub(v.copy().limit(1).mult(d));

      if (ra.collante) {
         collante=true;
         dx=p.x-ra.x;
      }
      return true;
    }
    return false;
  }
  public boolean collision(Brique br) {
    if (br.hit==0) return false;
    PVector pv = new PVector(min(max(p.x, br.pos.x), br.pos.x+br.l), min(max(p.y, br.pos.y), br.pos.y+br.h));
    float d = PVector.sub(p, pv).mag()-r;
    if (d<0) {
      if (int(pv.x)==int(br.pos.x) || int(pv.x)==int(br.pos.x+br.l)) v.x=-v.x;
      if (int(pv.y)==int(br.pos.y) || int(pv.y)==int(br.pos.y+br.h)) v.y=-v.y;
      p.sub(v.copy().limit(1).mult(d));
      br.hit();
      return true;
    }
    return false;
  }
}