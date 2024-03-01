/*todo this is simple abstract example*/
class Rectangle extends Shape {

  void draw() {
    print("Rectangle is drawn");
  }
}

class Circle extends Shape {

  void draw() {
    print("Circle is drawn");
  }
}

abstract class Shape {
  void draw();
}
