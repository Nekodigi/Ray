void line(PVector a, PVector b){
  line(a.x, a.y, a.z, b.x, b.y, b.z);
}

void translate(PVector p){
  translate(p.x, p.y, p.z);
}

void sphere(PVector origin, float r){
  pushMatrix();
  translate(origin);
  sphere(r);
  popMatrix();
}