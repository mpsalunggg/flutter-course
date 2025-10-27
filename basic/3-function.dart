// ==============================================
// 1. BASIC FUNCTIONS
// ==============================================

// Simple function tanpa parameter
void sayHello() {
  print('🎯 Hello, Dart Functions!');
}

// Function dengan return value
String getCurrentTime() {
  final now = DateTime.now();
  return 'Current time: ${now.hour}:${now.minute}:${now.second}';
}

// Function dengan parameters
double calculateArea(double length, double width) {
  return length * width;
}

// ==============================================
// 2. FUNCTION PARAMETERS
// ==============================================

// Optional positional parameters []
void introduce(String name, [int? age, String? city]) {
  print('Introduction:');
  print('Name: $name');
  if (age != null) print('Age: $age');
  if (city != null) print('City: $city');
  print('   ---');
}

// Optional named parameters {}
void registerUser({
  required String email,
  required String password,
  String? phone,
  bool isVerified = false,
  String role = 'user',
}) {
  print('User Registration:');
  print('Email: $email');
  print('Password: ${'*' * password.length}');
  if (phone != null) print('Phone: $phone');
  print('Verified: $isVerified');
  print('Role: $role');
  print('---');
}

// Default values untuk parameters
void greetPerson(String name, [String language = 'English']) {
  print('Hello $name! Language: $language');
}

// ==============================================
// 3. ARROW FUNCTIONS (Fat Arrow)
// ==============================================

// Single expression functions
int multiply(int a, int b) => a * b;

String getGrade(int score) => score >= 80
    ? 'A'
    : score >= 70
    ? 'B'
    : score >= 60
    ? 'C'
    : 'D';

bool isAdult(int age) => age >= 18;

String checkTemperature(double temp) => temp > 30
    ? 'Hot'
    : temp > 20
    ? 'Warm'
    : temp > 10
    ? 'Cool'
    : 'Cold';

// ==============================================
// 4. FIRST-CLASS & HIGHER-ORDER FUNCTIONS
// ==============================================

// Function sebagai parameter (Higher-order function)
void processNumbers(List<int> numbers, int Function(int) processor) {
  print('Processing numbers:');
  for (var number in numbers) {
    var result = processor(number);
    print('$number → $result');
  }
  print('---');
}

// Function yang return function
Function createMultiplier(int multiplier) {
  return (int value) => value * multiplier;
}

// Higher-order function untuk string processing
void processText(String text, String Function(String) processor) {
  final result = processor(text);
  print('Text processed: "$text" → "$result"');
}

// ==============================================
// 5. ANONYMOUS FUNCTIONS
// ==============================================

void demonstrateAnonymousFunctions() {
  var numbers = [1, 2, 3, 4, 5];
  var names = ['John', 'Jane', 'Bob', 'Alice'];

  print('Anonymous Functions Demo:');

  // forEach dengan anonymous function
  print('Numbers:');
  numbers.forEach((number) {
    print('- $number');
  });

  // map dengan arrow anonymous function
  var doubled = numbers.map((n) => n * 2);
  print('Doubled: ${doubled.toList()}');

  // where untuk filter
  var evens = numbers.where((n) => n % 2 == 0);
  print('Evens: ${evens.toList()}');

  // Complex anonymous function
  var longNames = names.where((name) {
    return name.length > 3 && name.contains('a');
  });
  print('Long names with "a": ${longNames.toList()}');

  print('---');
}

// ==============================================
// 6. GENERIC FUNCTIONS
// ==============================================

// Generic swap function
void swap<T>(List<T> list, int index1, int index2) {
  if (index1 < list.length && index2 < list.length) {
    print('Swapping ${list[index1]} with ${list[index2]}');
    T temp = list[index1];
    list[index1] = list[index2];
    list[index2] = temp;
  }
}

// Generic find function
T? findFirst<T>(List<T> list, bool Function(T) test) {
  for (var item in list) {
    if (test(item)) return item;
  }
  return null;
}

// Generic transform function
List<R> transformList<T, R>(List<T> list, R Function(T) transformer) {
  return list.map(transformer).toList();
}

// ==============================================
// 7. PRACTICAL EXAMPLE: CALCULATOR FUNCTIONS
// ==============================================

// Basic calculator operations
num add(num a, num b) => a + b;
num subtract(num a, num b) => a - b;
num multiplyNumbers(num a, num b) => a * b;
num divide(num a, num b) {
  if (b == 0) throw ArgumentError('Cannot divide by zero!');
  return a / b;
}

// Advanced calculator dengan optional operations
num calculate(num a, num b, {String operation = 'add'}) {
  switch (operation) {
    case 'add':
      return add(a, b);
    case 'subtract':
      return subtract(a, b);
    case 'multiply':
      return multiplyNumbers(a, b);
    case 'divide':
      return divide(a, b);
    default:
      throw ArgumentError('Invalid operation: $operation');
  }
}

void demonstrateCalculator() {
  print('Calculator Demo:');
  print('10 + 5 = ${calculate(10, 5)}');
  print('10 - 5 = ${calculate(10, 5, operation: 'subtract')}');
  print('10 × 5 = ${calculate(10, 5, operation: 'multiply')}');
  print('10 ÷ 5 = ${calculate(10, 5, operation: 'divide')}');

  try {
    print('10 ÷ 0 = ${calculate(10, 0, operation: 'divide')}');
  } catch (e) {
    print('Error: $e');
  }
  print('---');
}

// ==============================================
// 8. PRACTICAL EXAMPLE: USER MANAGEMENT FUNCTIONS
// ==============================================

// User data structure menggunakan Map
Map<String, dynamic> createUser(
  String name,
  int age,
  String email, {
  bool isActive = true,
}) {
  return {
    'name': name,
    'age': age,
    'email': email,
    'isActive': isActive,
    'createdAt': DateTime.now(),
  };
}

// Filter users berdasarkan kriteria
List<Map<String, dynamic>> filterUsers(
  List<Map<String, dynamic>> users,
  bool Function(Map<String, dynamic>) criteria,
) {
  return users.where(criteria).toList();
}

// Sort users berdasarkan field tertentu
void sortUsers(List<Map<String, dynamic>> users, String sortBy) {
  users.sort((a, b) {
    final aValue = a[sortBy];
    final bValue = b[sortBy];

    if (aValue is String && bValue is String) {
      return aValue.compareTo(bValue);
    } else if (aValue is int && bValue is int) {
      return aValue.compareTo(bValue);
    } else if (aValue is DateTime && bValue is DateTime) {
      return aValue.compareTo(bValue);
    }
    return 0;
  });
}

// Display users
void displayUsers(List<Map<String, dynamic>> users, String title) {
  print('$title (${users.length} users):');
  for (var user in users) {
    print('- ${user['name']} (${user['age']}) - ${user['email']}');
  }
  print('---');
}

// ==============================================
// 9. RECURSIVE FUNCTION
// ==============================================

int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// ==============================================
// MAIN FUNCTION - MENJALANKAN SEMUA CONTOH
// ==============================================

void main() {
  // 1. Basic Functions
  sayHello();
  print(getCurrentTime());
  print('Area of 5x3: ${calculateArea(5, 3)}');
  print('');

  // 2. Function Parameters
  introduce('John');
  introduce('Jane', 25);
  introduce('Bob', 30, 'Jakarta');

  registerUser(email: 'john@example.com', password: '123456');
  registerUser(
    email: 'jane@example.com',
    password: 'abcdef',
    phone: '+62123456',
    role: 'admin',
  );

  greetPerson('John');
  greetPerson('Jane', 'Indonesian');

  // 3. Arrow Functions
  print('Arrow Functions:');
  print('5 × 4 = ${multiply(5, 4)}');
  print('Score 85 → Grade: ${getGrade(85)}');
  print('Age 20 is adult: ${isAdult(20)}');
  print('Temperature 25°C is: ${checkTemperature(25)}');
  print('');

  // 4. Higher-Order Functions
  var numbers = [1, 2, 3, 4, 5];
  processNumbers(numbers, (n) => n * n); // Square
  processNumbers(numbers, (n) => n + 10); // Add 10

  var doubleIt = createMultiplier(2);
  var tripleIt = createMultiplier(3);
  print('Multipliers:');
  print('Double 5: ${doubleIt(5)}');
  print('Triple 5: ${tripleIt(5)}');

  processText('hello world', (text) => text.toUpperCase());
  processText('Dart Programming', (text) => text.replaceAll(' ', '_'));

  // 5. Anonymous Functions
  demonstrateAnonymousFunctions();

  // 6. Generic Functions
  print('Generic Functions:');
  var numberList = [1, 2, 3, 4, 5];
  var stringList = ['apple', 'banana', 'cherry'];

  print('Before swap: $numberList');
  swap(numberList, 0, 4);
  print('After swap: $numberList');

  var firstEven = findFirst(numberList, (n) => n % 2 == 0);
  var firstLongFruit = findFirst(stringList, (fruit) => fruit.length > 5);
  print('First even: $firstEven');
  print('First long fruit: $firstLongFruit');

  var squaredNumbers = transformList(numberList, (n) => n * n);
  var upperCaseFruits = transformList(
    stringList,
    (fruit) => fruit.toUpperCase(),
  );
  print('Squared numbers: $squaredNumbers');
  print('Upper case fruits: $upperCaseFruits');
  print('');

  // 7. Calculator Demo
  demonstrateCalculator();

  // 8. User Management Demo
  print('User Management Demo:');
  List<Map<String, dynamic>> users = [
    createUser('John Doe', 25, 'john@example.com'),
    createUser('Jane Smith', 30, 'jane@example.com'),
    createUser('Bob Johnson', 22, 'bob@example.com'),
    createUser('Alice Brown', 28, 'alice@example.com', isActive: false),
  ];

  displayUsers(users, 'All Users');

  // Filter active users
  var activeUsers = filterUsers(users, (user) => user['isActive'] == true);
  displayUsers(activeUsers, 'Active Users');

  // Filter users above 25
  var usersAbove25 = filterUsers(users, (user) => user['age'] > 25);
  displayUsers(usersAbove25, 'Users above 25');

  // Sort users by name
  sortUsers(users, 'name');
  displayUsers(users, 'Users sorted by name');

  // 9. Recursive Functions
  print('Recursive Functions:');
  print('Factorial of 5: ${factorial(5)}');
  print('Fibonacci sequence (first 10):');
  for (int i = 0; i < 10; i++) {
    print('- F($i) = ${fibonacci(i)}');
  }
}
