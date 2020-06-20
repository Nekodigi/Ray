int Nrays = 360;
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
ArrayList<Polygon> polygons = new ArrayList<Polygon>();

float na = 1;
float nb = 1.33;
float theta = 0;

void setup(){
  size(1000, 500);
  colorMode(HSB, 360, 100, 100);
  //fullScreen();
  stroke(255, 100);
  fill(255, 100);
  //barriers.add(new Barrier(0, 0, width, 0));
  //barriers.add(new Barrier(width, 0, width, height));
  //barriers.add(new Barrier(width, height, 0, height));
  //barriers.add(new Barrier(0, height, 0, 0));
    polygons.add(new Polygon(width/2, height/2, 200, 3));
}

void draw(){
  background(100);
  
  for(int i = 0; i < Nrays; i++){
    float n = map(i, 0, Nrays, 1.4, 1.46);
    float hue = map(i, 0, Nrays, 0, 300);
    stroke(hue, 100, 100);
    Ray ray = new Ray(mouseX, mouseY, TWO_PI-0.1, n);
    ray.update();
    ray.show();
  }
  //stroke(360);
  for(Barrier barrier : barriers){
     //barrier.show();
  }
  noStroke();
  for(Polygon polygon : polygons){
     polygon.show();
  }
}
