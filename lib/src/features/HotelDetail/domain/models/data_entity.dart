class DataEntity {
  final String id;
  final String name;
  final String description;

  DataEntity({
    required this.id,
    required this.name,
    required this.description,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    return DataEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
