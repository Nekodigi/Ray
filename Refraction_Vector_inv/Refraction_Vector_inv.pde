float na = 1;
float nb = 1.33;
float theta = 0;

void setup() {
  //fullScreen();
  size(500, 500);
  colorMode(RGB, 1, 1, 1, 1);
}

void draw() {
  background(1);
  //show grid
  stroke(0);
  translate(width/2, height/2);
  strokeWeight(2);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);
  fill(0, 1, 1, 0.1);
  rect(-width/2, 0, width, height/2);
  strokeWeight(10);
  PVector E = PVector.fromAngle(theta-HALF_PI).mult(-1);
  PVector N = new PVector(0, -1).mult(-1);
  float n1 = na;
  float n2 = nb;
  if(PVector.dot(E, N) > 0){//when light up from hehind
    N.mult(-1);
    n1 = nb;
    n2 = na;
  }
  float C1 = PVector.mult(E, -1).dot(N);
  float S1 = sqrt(1-C1*C1);
  //refrection
  float ndotd = PVector.dot(E, N);
  PVector R = PVector.sub(E, PVector.mult(N, 2*ndotd));//refrection vector
  //refraction
  float n12 = n1/n2;
  float S2 = n12*sqrt(1-C1*C1);
  float C2 = sqrt(1-S2*S2);
  PVector Edash = PVector.mult(E, n12).add(PVector.mult(N, n12*C1-C2));
  //float t = sqrt((nb/na)*(nb/na)-1+C1*C1)-C1;
  //PVector Edash = PVector.sub(E, N.mult(t)).mult(na/nb);//refraction vector
  //float C2 = PVector.mult(Edash, -1).dot(N);
  //calculate refraction rate with fresnel formula
  float sp = (n1*C2-n2*C1)/(n1*C2+n2*C1);//s-polarized light
  float pp = (n1*C1-n2*C2)/(n1*C1+n2*C2);//p-polarized light
  float kr = (sp+pp)/2;//refraction rate
  if (Float.isNaN(kr))kr = 1;
  float cr = 1-kr;//refrection rate
  float len = 10000;//for visualize
  //show ray
  stroke(1, 0, 0);
  line(0, 0, E.x*len, E.y*len);
  stroke(1, 0, 0, cr);
  line(0, 0, -Edash.x*len, -Edash.y*len);
  stroke(1, 0, 0, kr);
  line(0, 0, -R.x*len, -R.y*len);
  //rotate angle
  theta += 0.005;
  theta = theta % PI;
}