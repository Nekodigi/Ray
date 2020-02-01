Sphere sphere;
Plane plane;
boolean dispMode = true;

void setup(){
  size(1000, 1000, P3D);
  sphere = new Sphere(new PVector(0, 0, 0), 200);
  strokeWeight(5);
  plane = new Plane(new PVector(0, 0, 0), new PVector(0, 0, 5).normalize());
}

void draw(){
  background(200);
  lights();
  translate(width/2, height/2);
  rotateX(radians(-10));
  rotateY(radians(45));
  stroke(0);
  fill(0);
  Ray ray = new Ray(new PVector(0, 0, 400), new PVector(float(mouseX-width/2)/500, float(mouseY-height/2)/500, -1).normalize());
  ray.show();
  Ray result;
  noStroke();
  fill(255);
  if(dispMode){
    result = sphere.intersect(ray);
    sphere.show();
  }else{
    result = plane.intersect(ray);
    plane.show();
  }
  stroke(0);
  if(result != null){
    result.show(); 
  }
}

void keyPressed(){
  if(key=='d'){
    dispMode = !dispMode;
  }
}