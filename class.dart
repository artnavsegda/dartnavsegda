class MyClass {
  String greeting;
  MyClass(this.greeting);
  String hello(name) {
    return this.greeting + " " + name;
  }
}

main() {
  print(MyClass("Hello").hello("World"));
}
