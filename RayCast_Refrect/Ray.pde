class Ray{
  PVector sp, v;
  
  Ray(float sx, float sy, float vx, float vy){
    this(new PVector(sx, sy), new PVector(vx, vy));
  }
  
  Ray(PVector sp, PVector v){
    this.sp = sp;
    this.v = v;
  }
  
  Ray(float x, float y, float angle){
    this(x, y, PVector.fromAngle(angle).x, PVector.fromAngle(angle).y);
  }
  
  void update(){
    float bestDist = 10000000;
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
       Ray ray = refrection(bestP.copy(), v.copy(), hitBarrier);
       ray.show();
    }
  }
  
  void show(){
    line(sp, PVector.add(sp, v));
  }
}