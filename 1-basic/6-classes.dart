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

void main() {
  basicClass();
  print('===================');
  constructorClass();
  print('===================');
  getterSetterClass();
}
