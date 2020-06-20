Ray refraction(PVector sp, PVector d, Barrier barrier, boolean enter, float na_){
  d.normalize();
  PVector n = new PVector(barrier.ep.x - barrier.sp.x, barrier.ep.y - barrier.sp.y);
  n.normalize();
  n.rotate(radians(90));
  float na = na_, nb = 1;
  float n1 = na;
  float n2 = nb;
  if(PVector.dot(d, n) > 0){//when light up from hehind
    n.mult(-1);
    n1 = nb;
    n2 = na;
  }
  float C1 = PVector.mult(d, -1).normalize().dot(n);
  //float S1 = sqrt(1-C1*C1);
  //refrection
  //float ndotd = PVector.dot(d, n);
  //PVector R = PVector.sub(d, PVector.mult(n, 2*ndotd));//refrection vector
  //refraction
  float n12 = n1/n2;
  float S2 = n12*sqrt(1-C1*C1);
  float C2 = sqrt(1-S2*S2);
  PVector Edash = PVector.mult(d, n12).add(PVector.mult(n, n12*C1-C2));
  //float t = sqrt((nb/na)*(nb/na)-1+C1*C1)-C1;
  //PVector Edash = PVector.sub(E, N.mult(t)).mult(na/nb);//refraction vector
  //float C2 = PVector.mult(Edash, -1).dot(N);
  //calculate refraction rate with fresnel formula
  //float spp = (n1*C2-n2*C1)/(n1*C2+n2*C1);//s-polarized light
  //float pp = (n1*C1-n2*C2)/(n1*C1+n2*C2);//p-polarized light
  //float kr = (spp+pp)/2;//refraction rate
  //if (Float.isNaN(kr))kr = 1;
  //float cr = 1-kr;//refrection rate
  return new Ray(sp, Edash, na_);
}

PVector intersection(PVector s1, PVector e1, PVector s2, PVector e2) {
  float x1 = s1.x;
  float y1 = s1.y;
  float x2 = e1.x;
  float y2 = e1.y;
  float x3 = s2.x;
  float y3 = s2.y;
  float x4 = e2.x;
  float y4 = e2.y;
  float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
  if (den == 0) {
    return null;
  }
  
  float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
  float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
  if (t > 0 && t < 1 && u > 0) {
    PVector pt = new PVector();
    pt.x = x1 + t * (x2 - x1);
    pt.y = y1 + t * (y2 - y1);
    return pt;
  } else {
    return null;
  }
}
