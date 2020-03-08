int Nrays = 1;
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
ArrayList<Polygon> polygons = new ArrayList<Polygon>();

void setup(){
  //size(500, 500);
  fullScreen();
  //barriers.add(new Barrier(0, 0, width, 0));
  //barriers.add(new Barrier(width, 0, width, height));
  //barriers.add(new Barrier(width, height, 0, height));
  //barriers.add(new Barrier(0, height, 0, 0));
  for(int i = 0; i < 10; i++){
    polygons.add(new Polygon(random(width), random(height), random(width/5), (int)random(3, 6)));
  }
  strokeWeight(20);
}

void draw(){
  background(0);
  for(int i = 0; i < Nrays; i++){
    Ray ray = new Ray(mouseX, mouseY+i, 0);
    ray.update();
    if(ray.inside){
      fill(255, 0, 0);
    }else{
      fill(255);
    }
    ray.show();
    noStroke();
    ellipse(mouseX, mouseY, 50, 50);
  }
  fill(255, 150);
  noStroke();
  for(Barrier barrier : barriers){
     barrier.show();
  }
  for(Polygon polygon : polygons){
     polygon.show();
  }
}