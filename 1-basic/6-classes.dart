class Person {
  String name = "";
  int age = 0;

  void introduce() {
    print("   Halo, nama saya $name, umur $age tahun");
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

void main() {
  basicClass();
}
