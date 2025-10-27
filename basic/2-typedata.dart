void main() {
  int age = 25; // Bilangan bulat
  double price = 99.99; // Bilangan desimal
  num flexibleNumber = 10; // Bisa int atau double
  num anotherNumber = 10.5;

  // Operations
  int sum = age + 5; // 30
  double total = price * 2; // 199.98

  // Strings
  String name = "John Doe";
  String greeting = 'Hello World';

  // String Operations
  String fullName = name + " Smith"; // Concatenation
  String upperCase = name.toUpperCase(); // Method
  String interpolated = "Hello, $name!"; // Interpolation
  String calculated = "Sum: ${5 + 10}"; // Expression interpolation

  // Multi-line String
  String multiLine = '''
    This is a
    multi-line
    string  
  ''';

  print(multiLine);

  // Boolean
  bool isActive = true;
  bool isEmpty = false;
  bool isGreater = 10 > 5; // true// Boolean Operations
  bool result = isActive && isEmpty; // AND: false
  bool result2 = isActive || isEmpty; // OR: true
  bool result3 = !isActive; // NOT: false

  // List
  List<String> names = ["John", "Jane", "Bob"];
  List<int> numbers = [1, 2, 3, 4, 5];
  var mixed = [1, "hello", true]; // List<dynamic>
  print(names);
  print(numbers);
  // List Operations
  names.add("Alice"); // Add item
  names.remove("John"); // Remove item
  print(names[0]); // Access: "Jane"
  print(names.length); // Length: 3

  // Fixed-length List
  List<int> fixedList = List.filled(3, 0); // [0, 0, 0]

  // Map key value pairs
  Map exampleMap = {"name": "putra"};
  Map<String, dynamic> person = {
    "name": "Putra",
    "address": "Sultengg",
    "age": 23,
  };

  print(person);

  Map<String, int> scores = {"math": 90, "science": 85};

  // Map Operations
  person["city"] = "Jakarta";
  print(person["name"]);
  print(person.containsKey("age"));

  // Set operator
  Set<String> uniqueNames = {"John", "Jane", "John"};
  Set<int> numberss = {1, 2, 3, 4, 5};

  // Set Operations
  uniqueNames.add("Alice");
  uniqueNames.remove("John");
  print(uniqueNames.contains("Jane"));

  // Null
  String? nullableName = null;
  int? nullableAge;

  // Null-aware operators
  String nameku = nullableName ?? "Default";
  int length = nullableName?.length ?? 0;

  // Null aware operators
  String? maybeName;

  // Null-coalescing operator (??)
  String displayName = maybeName ?? "Guest";

  // Null-aware access (?.)
  int? lengths = maybeName?.length;

  // Null assertion (!)
  String definitelyName = maybeName!;
}
