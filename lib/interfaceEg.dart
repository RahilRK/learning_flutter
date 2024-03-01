/*todo this is simple interface example*/
class List implements SimpleInterface {
  @override
  void clickOne() {
   print("clickOne");
  }

  @override
  void clickTwo() {
    print("clickTwo");
  }

}

class SimpleInterface {
  void clickOne() {}

  void clickTwo() {}
}
