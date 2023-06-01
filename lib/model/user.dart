const String kAnonymousUserIdentifier = 'Anon';

/// Theme of the user either light, dark or auto
enum UserTheme {
  /// Light theme
  light,

  /// Dark theme
  dark,

  /// System theme (automatic)
  auto,
}

/// Status of the user either draft, invited, active, suspended or archived
enum UserStatus {
  /// Draft status
  draft,

  /// Invited status
  invited,

  /// Active status
  active,

  /// Suspended status
  suspended,

  /// Archived status
  archived,
}

/// An user within the app
class User {
  /// Id of the user used in Directus
  final String id;

  /// Email of the user
  final String? email;

  /// If the user has an email
  bool get hasEmail => email != null;

  /// First name of the user
  final String? firstName;

  /// Last name of the user
  final String? lastName;

  /// If the user has a full name
  bool get hasFullName => firstName != null && lastName != null;

  /// Full name of the user
  ///
  /// Will return null if either firstName or lastName is null
  String? get fullName {
    if (hasFullName) {
      return '$firstName $lastName';
    }

    return null;
  }

  // String? _avatar;
  // Future<File?>? get getAvatar => _avatar != null ? fileController.get(id: _avatar!) : null;
  // set avatar(File file) {
  //   _avatar = file.id;
  // }

  /// Avatar of the user
  final String? avatar;

  /// description of the user (bio)
  final String? description;

  /// Tags of the user
  final List<String>? tags;

  /// Language of the user
  final String? language;

  /// Theme of the user (dark, light or auto)
  final UserTheme? theme;

  /// If the user has email notifications enabled
  final bool emailNotifications;

  /// Status of the user (draft, invited, active, suspended or archived)
  final UserStatus? status;

  /// Role of the user
  final String? role;

  /// Last page visited by the user
  final String? lastPage;

  /// Last time the user accessed the app
  late final DateTime lastAccess;

  /// Identifier for user in the ui.
  ///
  /// Will attempt to use one of those parametters to do so and skip to the next if it doesn't exists:
  /// - firstName
  /// - lastName
  /// - email
  ///
  /// If none of them are provided it will defaults to 'Anon-$id'
  String get identifier {
    final List<String?> identifiers = [
      firstName,
      lastName,
      email,
    ];

    for (var i = 0; i < identifiers.length; i++) {
      if (identifiers[i] != null) {
        return identifiers[i]!;
      }
    }

    return '$kAnonymousUserIdentifier-$id';
  }

  /// Full name of the user or identifier if no name is provided
  String get fullNameOrIdentifier {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }

    return identifier;
  }

  /// Initials of the user
  ///
  /// Will return the first letter of the first name and last name if they are provided
  /// If not it will return the first letter of the identifier
  String get initials {
    if (firstName != null && lastName != null) {
      return '${firstName![0]}${lastName![0]}';
    }

    return identifier[0];
  }

  /// Creates a new [User]
  User({
    required this.id,
    this.email,
    this.firstName,
    this.lastName,
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

  /// Creates a new [User] from a json
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
        theme = json['theme'] != null
            ? UserTheme.values.firstWhere(
                (e) => e.toString() == 'UserTheme.${json['theme']}',
                orElse: () => UserTheme.auto,
              )
            : null,
        emailNotifications = json['email_notifications'] ?? false,
        status = json['status'] != null
            ? UserStatus.values.firstWhere(
                (e) => e.toString() == 'UserStatus.${json['status']}',
                orElse: () => UserStatus.draft,
              )
            : null,
        role = json['role'],
        lastPage = json['last_page'],
        lastAccess = json['last_access'] != null
            ? DateTime.parse(json['last_access'])
            : DateTime.now();

  /// Converts the [User] to a json
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
        'theme': theme?.toString().split('.').last,
        'email_notifications': emailNotifications,
        'status': status,
        'role': role,
      };
}
