class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String image;
  String location;
  String origin;

  Character.fromJson(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        status = map['status'] ?? '',
        species = map['species'] ?? '',
        type = map['type'] ?? '',
        gender = map['gender'] ?? '',
        image = map['image'] ?? '',
        location = map['location']?['name'] ?? 'Unknown',
        origin = map['origin']?['name'] ?? 'Unknown';
}
