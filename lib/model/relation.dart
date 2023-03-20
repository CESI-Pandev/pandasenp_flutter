

class Relation {
  final int userId1;
  final int userId2;
  final bool approve;

  Relation({
    required this.userId1,
    required this.userId2,
    this.approve = false,
  });
}
