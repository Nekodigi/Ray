int Nrays = 1000;
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
ArrayList<Polygon> polygons = new ArrayList<Polygon>();

void setup(){
  fullScreen();
  barriers.add(new Barrier(0, 0, width, 0));
  barriers.add(new Barrier(width, 0, width, height));
  barriers.add(new Barrier(width, height, 0, height));
  barriers.add(new Barrier(0, height, 0, 0));
  for(int i = 0; i < 10; i++){
    //new Polygon(random(width), random(height), random(100), (int)random(3, 6));
  }
  textAt(width/2-300, height/2, 300, '2');
  textAt(width/2-100, height/2, 300, '0');
  textAt(width/2+100, height/2, 300, '2');
  textAt(width/2+300, height/2, 300, '0');
}

void draw(){
  background(0);
  strokeWeight(10);
  stroke(255, 150);
  fill(255, 200);
  for(int i = 0; i < Nrays; i++){
    float theta = map(i, 0, Nrays, 0, TWO_PI);
    Ray ray = new Ray(mouseX, mouseY, theta);
    ray.update();
    ray.show();
  }
  noStroke();
  for(Barrier barrier : barriers){
     barrier.show();
  }
  for(Polygon polygon : polygons){
    polygon.show();
  }
}