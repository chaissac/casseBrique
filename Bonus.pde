class Bonus {

  PVector pos, vit;
  float l, h;
  int type;
  
  public Bonus(float x, float y) {
    type = int(random(8));
    // 0 : Petite raquette
    // 1 : Grande raquette
    // 2 : Raquette magnétique 
    // 3 : Tir
    // 4 : Balle x3
    // 5 : Balle +rapide
    // 6 : Balle +lente
    // 7 : Balle transpercante
    pos = new PVector(x+22, y+2);
    vit = new PVector(0, height/(8*tailleY));
    l=(width*.90)/tailleX-12;
    h= (height*.90)/(2*tailleY);
  }
  void hit() {
    type=-1;
  }
  public boolean trace() {
    if (type<0) return false;
    pos.add(vit);
    stroke(#F00000);
    strokeWeight(3);
    fill(#FF0000);
    ellipse(pos.x, pos.y, l, h);
    return (pos.y<height-h);
  }
}