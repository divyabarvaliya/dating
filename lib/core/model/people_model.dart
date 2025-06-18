class PeopleModel {
  final String name;
  final String profile;
  final int age;
  final String location;
  bool isOnline;
  String? matchPer;
  final String distance;

  PeopleModel({
    required this.name,
    required this.age,
    required this.location,
    required this.profile,
    required this.distance,
    this.isOnline = false,
    this.matchPer,
  });
}
