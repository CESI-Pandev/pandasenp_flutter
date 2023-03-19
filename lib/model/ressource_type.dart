class RessourceType {
  final int id;
  final String label;

  RessourceType({
    required this.id,
    required this.label,
  });

  factory RessourceType.fromJson(Map<String, dynamic> json) {
    return RessourceType(
      id: json['id'],
      label: json['label'],
    );
  }
}