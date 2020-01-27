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

void textAt(float x, float y, float fSize, char ch){
  PFont font = createFont("arial", fSize);
  PShape pShape = font.getShape(ch, 1);
  float xoff = x-fSize/4;
  float yoff = y+fSize/4;
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  fill(255);
  beginShape();
  for (int i = 0; i < pShape.getVertexCount(); i++) {
    PVector p = new PVector(xoff+pShape.getVertex(i).x, yoff+pShape.getVertex(i).y);
    vertices.add(p);
    vertex(p.x, p.y);
  }
  endShape();
  polygons.add(new Polygon(vertices));
}