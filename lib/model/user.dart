class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  get fullName => '$firstName $lastName';
  final String? avatar;
  final String? description;
  final String? tags;
  final String? language;
  final String? theme;
  final bool emailNotifications;
  final String status;
  final String? role;
  final String? lastPage;
  late final DateTime lastAccess;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.avatar,
    this.description,
    this.tags,
    this.language,
    this.theme,
    this.emailNotifications = false,
    required this.status,
    this.role,
    this.lastPage,
  }) {
    lastAccess = DateTime.now();
  }
}