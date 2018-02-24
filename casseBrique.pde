Raquette r ;
ArrayList<Balle> balles ;
ArrayList<Tir> tirs ;
Brique[] briques;
final int tailleX=12, tailleY=20;
int vitesse;
int tirOk;
void setup() {
  size(1200, 700);
  noCursor();
  //fullScreen();
  newGame();
  smooth();
}
void draw() {
  background(0);
  r.trace();
  if (mousePressed && mouseButton==LEFT && tirOk==0 ) {
    tirs.add(new Tir(r, r.x-r.l/2));
    tirs.add(new Tir(r, r.x+r.l/2));
    tirOk=10;
  }
  tirOk=max(0, tirOk-1);
  for (int i=balles.size()-1; i>=0; i--) {
    if (mousePressed && mouseButton==RIGHT) balles.get(i).collante=false;
    if (!balles.get(i).bouge(r)) balles.remove(i);
  }
  for (int i=tirs.size()-1; i>=0; i--) 
    if (!tirs.get(i).trace()) tirs.remove(i);

  for (Balle b : balles) {
    b.trace();
    for (int i=0; i<briques.length; i++) {
      b.collision(briques[i]);
    }
    b.trace();
  }
  for (Brique br : briques)  br.trace();
  if (balles.size()==0) newGame();
}
void newGame() {
  vitesse = 1;
  frameRate(vitesse*60);
  r=new Raquette();
  tirs = new ArrayList<Tir>();
  balles = new ArrayList<Balle>();
  balles.add(new Balle(r.x, r.y, PI/2+random(2)-1));
  balles.add(new Balle(r.x, r.y-r.h-5/2, PI/2+random(2)-1));
  balles.add(new Balle(r.x, r.y-r.h-5/2, PI/2+random(2)-1));
  briques = new Brique[tailleX*4];
  for (int j=0; j<4; j++) for (int i=0; i<tailleX; i++) briques[i+j*tailleX]=new Brique(i, j+2, int(random(6))+1);
  // briques = new Brique[1];
  // briques[0]=new Brique(2,1,3);
}