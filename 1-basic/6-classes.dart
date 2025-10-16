class Person {
  String name = "";
  int age = 0;

  void introduce() {
    print("   Halo, nama saya $name, umur $age tahun");
  }
}

class Student {
  String? name;
  String? school;
  double? grade;

  Student(this.name, this.school, this.grade);

  void printInformation(){
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

void constructorClass(){
  Student student1 = Student('Putra', 'SMA 2 PALU', 25);

  print(student1.name);
  print(student1.school);
  print(student1.grade);

  student1.printInformation();
}

void main() {
  basicClass();
  print('===================');
  constructorClass();
}
