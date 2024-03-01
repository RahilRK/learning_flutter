/*todo this is simple inheritance example*/
class Dog extends Animal {
  var age = 0;

  void bark() {
    print("Dog barks");
  }
}

class Cat extends Animal {
  var breed = "No name";

  void meow() {
    print("Cat meow");
  }
}

class Animal {
  String name = "";

  void eat() {}
}
