class Ray{
  PVector sp, v;
  float n;//this is value to reproduce phenomenon which change refraction rate via wavelength
  boolean inside = false;
  
  Ray(float sx, float sy, float vx, float vy, float n){
    this(new PVector(sx, sy), new PVector(vx, vy), n);
  }
  
  Ray(PVector sp, PVector v, float n){
    this.sp = sp;
    this.v = v;
    this.n = n;
  }
  
  Ray(float x, float y, float angle, float n){
    this(x, y, PVector.fromAngle(angle).x, PVector.fromAngle(angle).y, n);
  }
  
  void update(){
    float bestDist = 100000;
    PVector bestP = null;
    Barrier hitBarrier = null;
    for(Barrier barrier : barriers){
      PVector p = intersection(barrier.sp, barrier.ep, sp, PVector.add(sp, v));
      if(p != null){
        float distance = dist(p.x, p.y, sp.x, sp.y);
        if(distance < bestDist){
          bestDist = distance;
          hitBarrier = barrier;
          bestP = p;
        }
      }
    }
    if(bestP != null){
       v = PVector.sub(bestP, sp);
       Ray ray = refraction(bestP.copy(), v.copy(), hitBarrier, inside, n);
       ray.inside = !inside;
       ray.sp.add(PVector.mult(v, EPSILON));
       ray.update();
       ray.show();
    }else{
       //v = PVector.sub(bestP, sp);
       //Ray ray = refraction(bestP.copy(), v.copy(), hitBarrier);
       //ray.sp.add(PVector.mult(v, EPSILON));
       //ray.update();
       v.mult(1000);
       show();
    }
  }
  
  void show(){
    line(sp, PVector.add(sp, v));
  }
}
