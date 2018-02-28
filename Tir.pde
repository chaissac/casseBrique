class Tir {
  PVector p, v;
  public Tir(Raquette ra, float x) {
    p = new PVector(x, ra.y);
    v = new PVector(0, -10);
  }
  public boolean trace() {
    p.add(v);
    stroke(255);
    strokeWeight(4);
    line(p.x, p.y, p.x, p.y-8);
    for (int i=0; i<briques.size(); i++) 
      if (collision(briques.get(i))) return false;
    for (int i=0; i<bonus.size(); i++) 
      if (collision(bonus.get(i))) return false;
    return (p.y>0) ;
  }
  public boolean collision(Object o) {
    if (o.getClass() == Brique.class) {
      Brique b = (Brique) o;
      if (b.hit==0) return false;
      if (p.x>=b.pos.x && p.x<=b.pos.x+b.l && p.y>=b.pos.y && p.y<=b.pos.y+b.h) {
        b.hit();
        return true;
      }
    } else if (o.getClass() == Bonus.class) {
      Bonus b = (Bonus) o;
      if (p.x>=b.pos.x && p.x<=b.pos.x+b.l && p.y>=b.pos.y && p.y<=b.pos.y+b.h) {
        b.hit();
        return true;
      }
    }
    return false;
  }
}