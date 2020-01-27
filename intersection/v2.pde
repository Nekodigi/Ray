PVector intersectionV2(PVector p1, PVector v1, PVector p2, PVector v2) {
  float t1 = v2.y*v1.x - v2.x*v1.y;
  if (t1 == 0) {
    return null;
  }
  float ta = v2.x*(p1.y-p2.y) - v2.y*(p1.x-p2.x);
  float tb = v1.x*(p1.y-p2.y) - v1.y*(p1.x-p2.x);
  float ua = ta/t1;
  float ub = tb/t1;
  if (ua > 0 && ua < 1 && ub > 0) {
    float x = p1.x + ua*v1.x;
    float y = p1.y + ub*v1.y;
    return new PVector(x, y);
  } else {
    return null;
  }
}

PVector intersectionV2SP(PVector p1s, PVector p1e, PVector p2s, PVector p2e) {
  float x1 = p1s.x;
  float y1 = p1s.y;
  float x2 = p1e.x;
  float y2 = p1e.y;
  float x3 = p2s.x;
  float y3 = p2s.y;
  float x4 = p2e.x;
  float y4 = p2e.y;
  float vx1 = x1 - x2;
  float vy1 = y1 - y2;
  float vx2 = x3 - x4;
  float vy2 = y3 - y4;
  //float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
  float den = vx1 * vy2 - vy1 * vx2;
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
  //return intersectionV2(p1s, p1s.sub(p1e), p2s, p2s.sub(p2e));
}