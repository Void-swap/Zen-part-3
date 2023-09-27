class Doctor {
  //properties
  final String name;
  final String occupation;
  final String imagefrmAsset;
  final String description;
  final String location;
  final String timings;
  final String services;
  final String contact;
  final int fees;

  Doctor({
    required this.location,
    required this.description,
    required this.imagefrmAsset,
    required this.name,
    required this.occupation,
    required this.timings,
    required this.services,
    required this.contact,
    required this.fees,
    // required String imageFrmAsset,
  });
}

class Interns {
  final String name;
  final String occupation;
  final String imagefrmAsset;
  final String description;
  final String location;
  final String timings;
  final String services;
  final String contact;

  Interns({
    required this.location,
    required this.description,
    required this.imagefrmAsset,
    required this.name,
    required this.occupation,
    required this.timings,
    required this.services,
    required this.contact,
  });
}
