class Tir {
  PVector p, v;
  public Tir(Raquette ra, float x) {
    p = new PVector(x,ra.y);
    v = new PVector(0,-10);
  }
  public boolean trace() {
    p.add(v);
    stroke(255);
    strokeWeight(4);
    line(p.x,p.y,p.x,p.y-8);
    return (p.y>0) ;
  }
}