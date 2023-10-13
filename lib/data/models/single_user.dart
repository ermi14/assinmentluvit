import 'package:firebase_database/firebase_database.dart';

class SingleUser {
  List<Object?> images;
  String name;
  String description;
  int likeCount;
  String location;
  int age;
  List<Object?> tags;

  SingleUser({
    required this.images,
    required this.name,
    required this.description,
    required this.likeCount,
    required this.location,
    required this.age,
    required this.tags,
  });

  factory SingleUser.fromSnapshot(DataSnapshot snapshot) {
    Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

    return SingleUser(
      images: values['images'],
      name: values['name'],
      description: values['description'],
      likeCount: values['likeCount'],
      location: values['location'],
      age: values['age'],
      tags: values['tags'],
    );
  }
}
