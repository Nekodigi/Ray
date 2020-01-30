int Nrays = 500;
float angle;
ArrayList<Barrier> barriers = new ArrayList<Barrier>();

void setup(){
  size(1000, 500);
  barriers.add(new Barrier(0, 0, width/2, 0));
  barriers.add(new Barrier(width/2, 0, width/2, height));
  barriers.add(new Barrier(width/2, height, 0, height));
  barriers.add(new Barrier(0, height, 0, 0));
  for(int i = 0; i < 10; i++){
    new Polygon(random(width/2), random(height), random(100), (int)random(3, 6));
  }
}

void mouseWheel(MouseEvent e ){
  if( e.getAmount() < 0 ){
    angle += 0.1;
  } else {
    angle -= 0.1;
  }
}

void draw(){
  background(0);
  for(int i = 0; i < Nrays; i++){
    float theta = map(i, 0, Nrays, 0, HALF_PI)+angle;
    stroke(255, 100);
    Ray ray = new Ray(constrain(mouseX, 0, width/2), mouseY, theta);
    ray.update();
    ray.show();
    float d = 25000.0 / ray.v.mag();
    stroke(d);
    line(i+width/2, height/2+d, i+width/2, height/2-d);
  }
  for(Barrier barrier : barriers){
     barrier.show();
  }
}