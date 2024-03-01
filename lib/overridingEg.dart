/*todo this is simple overriding example*/
class Eagle extends Bird {
  var age = 0;

  void eat() {
    print("Eagle is eating");
  }

  void fly() {
    super.fly();
    print("Eagle is flying");
  }

}

class Bird {
  String name = "";

  void fly() {
    print("Bird is flying");
  }
}
