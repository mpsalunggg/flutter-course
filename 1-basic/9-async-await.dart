void main() async {
  print("Mulai program");

  String userData = await fetchUserData();
  print(userData);
}

Future<String> fetchUserData() async {
  for (int i = 1; i <= 4; i++) {
    await Future.delayed(Duration(seconds: 1));
    print("Mengambil data... $i");
  }
  return 'Data user: Budi Santoso';
}
