int returnOne() {
  return 1;
}

doOne() {
  print(returnOne());
}

void doTwo() {
  print("Do two");
}

doThree(someNumber) {
  print(someNumber);
}

doFour({someNumber}) {
  print(someNumber);
}

main() {
  doOne();
  doTwo();
  doThree(3);
  doFour(someNumber: 4);
}
