void main() {
  // Deklarasi Eksplisit
  String name = "John";
  int age = 25;
  double height = 175.5;
  bool isStudent = true;

  // Deklarasi dengan var
  var names = "John";

  // Deklarasi dengan final
  final String college = "University of Dart";
  final score = 100;

  // Deklarasi dengan const
  const double pi = 3.14;
  const maxUsers = 1000;
  // const random = Random().nextInt(10);

  // Deklarasi dengan dynamic
  dynamic variable = "Hello";
  variable = 100;
  variable = true;

  // Deklarasi dengan late
  late String description;
  late final int finalValue;

  description = "This is initialized later";
  finalValue = 100;
}
