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
    for (int i=0; i<briques.length; i++) 
      if (collision(briques[i])) return false;
    return (p.y>0) ;
  }
  public boolean collision(Brique br) {
    if (br.hit==0) return false;
    if (p.x>=br.pos.x && p.x<=br.pos.x+br.l && p.y>=br.pos.y && p.y<=br.pos.y+br.h) {
      br.hit();
      return true;
    }
    return false;
  }
}