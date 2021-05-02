int returnOne() {
  return 1;
}

doOne() {
  print(returnOne());
}

void doTwo() {
  print("Do two");
}

main() {
  doOne();
  doTwo();
}
