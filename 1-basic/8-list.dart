void main() {
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  List<int> numbers = [1, 2, 3, 4, 5];

  List<String> cities = List.empty(growable: true);
  cities.add('Jakarta');
  cities.add('Surabaya');

  List<int> fixedList = List.filled(3, 0);

  List<int> squares = List.generate(5, (index) => index * index);

  print("Fruits: $fruits");
  print("Numbers: $numbers");
  print("Cities: $cities");
  print("Fixed List: $fixedList");
  print("Squares: $squares");
}
