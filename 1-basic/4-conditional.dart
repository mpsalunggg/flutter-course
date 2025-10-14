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
    print('Text is null or empty');
  }

  print('');
}

void typeCasting() {
  dynamic value = 'Hello Dart';

  if (value is String) {
    print('   Value is String: ${value.toUpperCase()}');
  }

  if (value is int) {
    print('   Value is Integer: ${value + 10}');
  }

  if (value is! bool) {
    print('   Value is not boolean');
  }

  Object text = 'Hello World';
  if (text is String) {
    String message = text as String;
    print('   Casted message: $message');
  }

  print('');
}

void main() {
  nullAwareConditions();
  print("===================");
}
