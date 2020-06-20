class Polygon{
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  
  Polygon(float x, float y, float r, int n){
    for(int i = 0; i < n; i++){
      float theta = map(i, 0, n, 0, TWO_PI)+radians(30);
      vertices.add(new PVector(x+cos(theta)*r, y+sin(theta)*r));
    }
    calcBarrier();
  }
  
  Polygon(ArrayList<PVector> vertices){
    this.vertices = vertices;
    calcBarrier();
  }
  
  void calcBarrier(){
    for(int i = 0; i < vertices.size(); i++){
      barriers.add(new Barrier(vertices.get(i), vertices.get((i+1)%vertices.size())));
    } 
  }
  
  void show(){
    beginShape();
    for(PVector vertice : vertices){
      vertex(vertice.x, vertice.y);
    }
    endShape();
  }
}
