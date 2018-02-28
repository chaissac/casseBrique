Raquette r ;
ArrayList<Balle> balles ;
ArrayList<Tir> tirs ;
ArrayList<Brique> briques ;
ArrayList<Bonus> bonus ;

final int tailleX=13, tailleY=25;
int vitesse, tirOk, nbBriques;

void setup() {
  size(800, 600);
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
  for (int i=bonus.size()-1; i>=0; i--) 
    if (!bonus.get(i).trace()) bonus.remove(i);

  for (Balle b : balles) {
    b.trace();
    for (int i=0; i<briques.size(); i++) {
      b.collision(briques.get(i));
    }
    for (int i=0; i<briques.size(); i++) {
      b.collision(briques.get(i));
    }
    b.trace();
  }
  for (int i=briques.size()-1; i>=0; i--) if (!briques.get(i).trace()) briques.remove(i);;
  if (balles.size()==0 ||briques.size()==0) newGame();
}
void newGame() {
  vitesse = 1;
  frameRate(vitesse*60);
  r=new Raquette();
  tirs = new ArrayList<Tir>();
  balles = new ArrayList<Balle>();
  balles.add(new Balle(r.x, r.y, -PI/2+random(2)-1));
  balles.add(new Balle(r.x, r.y-r.h-5/2, -PI/2+random(2)-1));
  balles.add(new Balle(r.x, r.y-r.h-5/2, -PI/2+random(2)-1));
  bonus = new ArrayList<Bonus>();
  briques = new ArrayList<Brique>();
  nbBriques=0;
  for (int j=1; j<4; j++) for (int i=1; i<tailleX-1; i++) briques.add(new Brique(i, j+2, int(random(6))+1));
  // briques = new Brique[1];
  // briques[0]=new Brique(2,1,3);
}