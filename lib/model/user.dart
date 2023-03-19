class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  get fullName => '$firstName $lastName';
  // String? _avatar;
  // Future<File?>? get getAvatar => _avatar != null ? fileController.get(id: _avatar!) : null;
  // set avatar(File file) {
  //   _avatar = file.id;
  // }
  final String? avatar;
  final String? description;
  final List<String>? tags;
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
    // _avatar = avatar;
    lastAccess = DateTime.now();
  }

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      email = json['email'],
      firstName = json['first_name'],
      lastName = json['last_name'],
      // _avatar = json['avatar'],
      avatar = json['avatar'],
      description = json['description'],
      tags = json['tags'] != null ? List<String>.from(json['tags']) : null,
      language = json['language'],
      theme = json['theme'],
      emailNotifications = json['email_notifications'] ?? false,
      status = json['status'],
      role = json['role'],
      lastPage = json['last_page'],
      lastAccess = json['last_access'] != null ? DateTime.parse(json['last_access']) : DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    // 'avatar': _avatar,
    'avatar': avatar,
    'description': description,
    'tags': tags,
    'language': language,
    'theme': theme,
    'email_notifications': emailNotifications,
    'status': status,
    'role': role,
  };
}