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

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      email = json['email'],
      firstName = json['first_name'],
      lastName = json['last_name'],
      avatar = json['avatar'],
      description = json['description'],
      tags = json['tags'],
      language = json['language'],
      theme = json['theme'],
      emailNotifications = json['email_notifications'] ?? false,
      status = json['status'],
      role = json['role'],
      lastPage = json['last_page'],
      lastAccess = json['last_access'] != null ? DateTime.parse(json['last_access']) : DateTime.now();
      
  // Future<User> get currentUser async {
  //   if (directus == null) {
  //     throw Exception('Directus not initialized');
  //   }
  //   return User.fromJson((await directus!.auth.currentUser!.read()).data.toJson());
  // }
  
}