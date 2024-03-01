/*todo this example explains different types of constructors*/
class Car {
  var name = "No name";
  var topSpeed = 0;

  /*Car() {
    //Default constructor
    print("This is my default constructor");
  }*/

  Car({this.name = "", this.topSpeed = 0}); //Parameterized constructor

  Car.myNamedConstructor1() {
    print("This is named constructor");
  }

  Car.myNamedConstructor2({this.name = "", this.topSpeed = 0}); //Parameterized constructor

  void carDetail() {
    print("Car:$name, top speed: $topSpeed");
  }
}
