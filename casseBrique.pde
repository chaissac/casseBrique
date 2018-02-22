Raquette r ;
ArrayList<Balle> balles ;
Brique[] briques;
final int tailleX=13, tailleY=20;
int vitesse;
void setup() {
  size(800,450);
  //fullScreen();
  newGame();
}
void draw() {
  background(0);
  r.trace();
  for(int i=balles.size()-1;i>=0;i--) if (!balles.get(i).bouge(r)) balles.remove(i);
  for(Balle b:balles) b.trace();
  for(Brique br:briques) br.trace();
  if (balles.size()==0) newGame();

}
void newGame() {
  vitesse = 1;
  frameRate(vitesse*60);
  r=new Raquette();
  balles = new ArrayList<Balle>();
  balles.add(new Balle(r.x,r.y-r.h-5/2,-PI/2+random(1)));
  //balles.add(new Balle(r.x,r.y-r.h-5/2,-PI/2+random(1)));
  //balles.add(new Balle(r.x,r.y-r.h-5/2,-PI/2+random(1)));
  briques = new Brique[tailleX*4];
  for (int j=0; j<4; j++) for (int i=0;i<tailleX;i++) briques[i+j*tailleX]=new Brique(i,j,int(random(6))+1);
}