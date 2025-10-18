void main() {
  Map<String, int> ages = {'john': 30, 'jane': 28};
  print('ages: $ages');

  ages.forEach((name, age) {
    print('$name is $age years old');
  });

  print("with map literals:");
  Map<String, String> capitals = {
    'Palu': 'Indonesia',
    'Jakarta': 'Indonesia',
    'Tokyo': 'Japan',
  };

  var reversedCapitals = capitals.map((key, value) {
    return MapEntry(key, value);
  });

  print(reversedCapitals);

  Map<String, List<String>> grouped = {};
  reversedCapitals.forEach((country, city) {
    grouped.putIfAbsent(country, () => []).add(city);
  });

  print(grouped);

  List<MapEntry<String, String>> entries = capitals.entries.toList();
  for (var entry in entries) {
    print('${entry.key} is in ${entry.value}');
  }
  ;
}
