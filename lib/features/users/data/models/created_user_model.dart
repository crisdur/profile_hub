class CreatedUserModel {
  final String id;
  final String name;
  final String job;
  final DateTime createdAt;

  CreatedUserModel({
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  });

  factory CreatedUserModel.fromJson(Map<String, dynamic> json) {
    return CreatedUserModel(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'job': job,
      'createdAt': createdAt.toIso8601String(),
    };
  }
} 