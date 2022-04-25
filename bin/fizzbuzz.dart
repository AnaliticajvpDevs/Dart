main() {
  List number = [];
  int n = 1;
  for (n; n < 100; n++) {
    number.add(n);
  }
  for (var item in number) {
    if (item % 3 == 0 && item % 5 == 0) {
      print('FizzBuzz');
    }
    if (item % 5 == 0) {
      print('Buzz');
    }
    if (item % 3 == 0) {
      print('Fizz');
    }
    if (item % 3 != 0 && item % 5 != 0) {
      print(item);
    }
  }
}
