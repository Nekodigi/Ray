int Nrays = 1000;
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
ArrayList<Polygon> polygons = new ArrayList<Polygon>();

void setup(){
  size(500, 500);
  //fullScreen();
  stroke(255, 100);
  fill(255, 100);
  //barriers.add(new Barrier(0, 0, width, 0));
  //barriers.add(new Barrier(width, 0, width, height));
  //barriers.add(new Barrier(width, height, 0, height));
  //barriers.add(new Barrier(0, height, 0, 0));
  for(int i = 0; i < 10; i++){
    polygons.add(new Polygon(random(width), random(height), random(100), (int)random(3, 6)));
  }
}

void draw(){
  background(0);
  for(int i = 0; i < Nrays; i++){
    float theta = map(i, 0, Nrays, 0, HALF_PI);
    Ray ray = new Ray(mouseX, mouseY, theta);
    ray.update();
    ray.show();
  }
  for(Barrier barrier : barriers){
     barrier.show();
  }
  for(Polygon polygon : polygons){
     polygon.show();
  }
}