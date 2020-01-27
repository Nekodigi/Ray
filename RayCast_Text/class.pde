class Ray{
  PVector sp, v;
  
  Ray(float sx, float sy, float vx, float vy){
    this.sp = new PVector(sx, sy);
    this.v = new PVector(vx, vy);
  }
  
  Ray(float x, float y, float angle){
    this(x, y, PVector.fromAngle(angle).x, PVector.fromAngle(angle).y);
  }
  
  void update(){
    float bestDist = 10000000;
    PVector bestP = null;
    for(Barrier barrier : barriers){
      PVector p = intersection(barrier.sp, barrier.ep, sp, PVector.add(sp, v));
      if(p != null){
        float distance = dist(p.x, p.y, sp.x, sp.y);
        if(distance < bestDist){
          bestDist = distance;
          bestP = p;
        }
      }
    }
    if(bestP != null){
       v = PVector.sub(bestP, sp);;
    }
  }
  
  void show(){
    line(sp, PVector.add(sp, v));
  }
}

class Barrier{
  PVector sp, ep;
  
  Barrier(float sx, float sy, float ex, float ey){
    this(new PVector(sx, sy), new PVector(ex, ey));
  }
  
  Barrier(PVector sp, PVector ep){
    this.sp = sp;
    this.ep = ep;
  }
  
  void show(){
     line(sp, ep);
  }
}