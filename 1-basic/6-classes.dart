class Person {
  String name = "";
  int age = 0;

  void introduce() {
    print("Halo, nama saya $name, umur $age tahun");
  }

  String get getName {
    return name;
  }

  void set setName(String name) {
    this.name = name;
  }

  void setAge(int age) {
    if (age < 0) {
      print("Umur tidak boleh negatif");
    } else {
      this.age = age;
    }
  }
}

class Person2 {
  String? name;
  int? age;

  Person2(this.name, this.age);

  void introduce() {
    print("Halo, nama saya $name, umur $age tahun");
  }
}

class Student {
  String? name;
  String? school;
  double? grade;

  Student(this.name, this.school, this.grade);

  // for constructor naming
  Student.testingUser(this.name) : grade = 4;

  void printInformation() {
    print('My name is $name, im from $school , and my grade is $grade');
  }
}

void basicClass() {
  Person person1 = Person();
  person1.name = "Budi";
  person1.age = 25;
  person1.introduce();

  Person person2 = Person();
  person2.name = "Sari";
  person2.age = 22;
  person2.introduce();

  print("");
}

void constructorClass() {
  Student student1 = Student('Putra', 'SMA 2 PALU', 25);

  print(student1.name);
  print(student1.school);
  print(student1.grade);

  student1.printInformation();

  Student testingUser = Student.testingUser("Mps");

  // school can be null
  print(
    'name: ${testingUser.name}, school: ${testingUser.school}, grade: ${testingUser.grade}',
  );
}

void getterSetterClass() {
  Person person3 = Person();
  person3.setName = "Andi";
  person3.setAge(30);
  person3.introduce();

  print("Name: ${person3.getName}");
}

class Manager extends Person {
  String? department;
  String? location;

  // without super keyword
  Manager(String name, String age, this.department, this.location) {
    this.name = name;
    this.age = int.parse(age);
  }
  void showDepartment() {
    print("Department: $department");
  }

  void showLocation() {
    print("Location: $location");
  }
}

class Employee extends Person2 {
  String? company;

  // with super keyword
  Employee(String name, String age, this.company) : super(name, int.parse(age));

  void showCompany() {
    print("Company: $company");
  }
}

void inheritanceClass() {
  Manager manager1 = Manager("Rina", "35", "HRD", "Jakarta");
  manager1.introduce();
  manager1.showDepartment();
  manager1.showLocation();

  Employee employee1 = Employee("Dodi", "28", "Google");
  employee1.introduce();
  employee1.showCompany();
}

class Shape {
  int? sides;
  void draw() {
    print("Drawing a shape");
  }
}

class Circle extends Shape {
  double? radius;

  Circle(this.radius) {
    sides = 0;
  }

  @override
  void draw() {
    print("Drawing a circle with radius $radius");
  }
}

void overrideClass() {
  Circle circle = Circle(5);
  circle.draw();
}

class StaticExample {
  static String staticField = "I am a static field";

  static void staticMethod() {
    print("I am a static method");
  }
}

void staticClass() {
  // example
  print('Static members are accessed using the class name');
  print(StaticExample.staticField);
  StaticExample.staticMethod(); 
}

abstract class AbstractShape {
  void draw();

  void info() {
    print("This is an abstract shape");
  }
}

class Circle2 extends AbstractShape {
  double radius;

  Circle2(this.radius);

  @override
  void draw() {
    print("Drawing a circle with radius $radius");
  }

  @override
  void info() {
    print("This is a circle with radius $radius");
  }
}

void abstractClass() {
  Circle2 circle = Circle2(10);
  circle.draw();
  circle.info();
}

void main() {
  basicClass();
  print('===================');
  constructorClass();
  print('===================');
  getterSetterClass();
  print('===================');
  inheritanceClass();
  print('===================');
  overrideClass();
  print('===================');
  staticClass();
  print('===================');
  abstractClass();
}