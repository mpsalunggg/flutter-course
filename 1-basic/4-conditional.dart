enum Color { red, green, blue }

void ifelse() {
  int age = 25;

  if (age > 20) {
    print('Dewasaaa');
  } else if (age > 17 && age <= 20) {
    print('Remajaaa');
  } else {
    print('Ank anak');
  }
}

void ternaryOperator() {
  int age = 20;
  String status = age >= 18 ? 'Adult' : 'Minor';
  print('Age $age: $status');

  int number = 15;
  String result = number % 2 == 0 ? 'Even' : 'Odd';
  print('Number $number is $result');

  int score = 85;
  String grade = score >= 90
      ? 'A'
      : score >= 80
      ? 'B'
      : score >= 70
      ? 'C'
      : score >= 60
      ? 'D'
      : 'F';
  print('Score $score: Grade $grade');
}

void switchCaseStatement() {
  String day = 'Monday';

  switch (day) {
    case 'Monday':
      print('Start of the work week');
      break;
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
      print('Middle of the work week');
      break;
    case 'Friday':
      print('Last work day');
      break;
    case 'Saturday':
    case 'Sunday':
      print('Weekend!');
      break;
    default:
      print('Invalid day');
  }

  Color favoriteColor = Color.blue;

  switch (favoriteColor) {
    case Color.red:
      print('   Favorite color is Red');
      break;
    case Color.green:
      print('   Favorite color is Green');
      break;
    case Color.blue:
      print('   Favorite color is Blue');
      break;
  }
}

void nullAwareConditions() {
  String? name;
  String? email = 'user@example.com';

  String displayName = name ?? 'Guest';
  print('Display Name: $displayName');

  if (email?.contains('@') ?? false) {
    print('Valid email format');
  } else {
    print('Invalid email or null');
  }

  String? text;
  if (text?.isEmpty ?? true) {
    text = "Hai gaiss";
    print('Text is null or empty');
  }

  print('');
}

void typeCasting() {
  dynamic value = 'Hello Dart';

  if (value is String) {
    print('Value is String: ${value.toUpperCase()}');
  }

  if (value is int) {
    print('Value is Integer: ${value + 10}');
  }

  if (value is! bool) {
    print('Value is not boolean');
  }

  Object text = 'Hello World';
  if (text is String) {
    String message = text as String;
    print('   Casted message: $message');
  }

  print('');
}

void main() {
  ifelse();
  print("===================");
  ternaryOperator();
  print("===================");
  switchCaseStatement();
  print("===================");
  nullAwareConditions();
  print("===================");
  typeCasting();
}
