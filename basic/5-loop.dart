void forLoop() {
  for (int i = 1; i <= 5; i++) {
    print('Iteration $i');
  }

  List<String> fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
  for (int i = 0; i < fruits.length; i++) {
    print('Fruit ${i + 1}: ${fruits[i]}');
  }

  print('');
}

void forInLoop() {
  List<String> colors = ['Red', 'Green', 'Blue', 'Yellow'];
  for (String color in colors) {
    print('Color: $color');
  }

  Map<String, int> scores = {'Alice': 95, 'Bob': 87, 'Charlie': 92};
  print(scores);
  for (var entry in scores.entries) {
    print('${entry.key}: ${entry.value}');
  }

  List<Map<String, dynamic>> students = [
    {"id": 1, "name": "Putra"},
    {"id": 1, "name": "Satria"},
  ];

  var test = students.map((user) {
    print(user['id']);
    return {'name': user['name']};
  });

  print('tessss $test');

  print('');
}

void whileLoop() {
  int count = 1;
  while (count <= 5) {
    print('Count: $count');
    count++;
  }

  int num = 2;
  while (num <= 32) {
    print('Power of 2: $num');
    num *= 2;
  }

  print('');
}

void doWhileLoop() {
  int i = 1;
  do {
    print('Number: $i');
    i++;
  } while (i <= 5);

  int x = 10;
  do {
    print('This runs at least once, x = $x');
  } while (x < 5);

  print('');
}

void breakStatement() {
  for (int i = 1; i <= 10; i++) {
    if (i == 6) {
      print('Breaking at $i');
      break;
    }
    print('Number: $i');
  }

  int count = 0;
  while (true) {
    count++;
    if (count > 3) {
      print('Breaking while loop at $count');
      break;
    }
    print('Count: $count');
  }

  print('');
}

void continueStatement() {
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue;
    }
    print('Odd number: $i');
  }

  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  for (int num in numbers) {
    if (num % 3 == 0) {
      continue;
    }
    print('Not divisible by 3: $num');
  }

  print('');
}

void nestedLoops() {
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print('$i x $j = ${i * j}');
    }
  }

  print('Pattern:');
  for (int i = 1; i <= 5; i++) {
    String line = '';
    for (int j = 1; j <= i; j++) {
      line += '* ';
    }
    print(line);
  }

  print('');
}

void forEachMethod() {
  List<int> numbers = [10, 20, 30, 40, 50];
  numbers.forEach((num) {
    print('Number: $num');
  });

  List<String> languages = ['Dart', 'Java', 'Python', 'JavaScript'];
  languages.asMap().forEach((index, lang) {
    print('${index + 1}. $lang');
  });

  print('');
}

void main() {
  forLoop();
  print('===================');
  forInLoop();
  print('===================');
  whileLoop();
  print('===================');
  doWhileLoop();
  print('===================');
  breakStatement();
  print('===================');
  continueStatement();
  print('===================');
  nestedLoops();
  print('===================');
  forEachMethod();
}
