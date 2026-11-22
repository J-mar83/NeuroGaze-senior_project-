enum CommandType { needs, care, comfort, talk, emergency }

class CommandRequest {
  final String id;
  final String patientId;
  final CommandType type;
  final String title;
  final DateTime requestedAt;
  DateTime? executedAt;

  CommandRequest({
    required this.id,
    required this.patientId,
    required this.type,
    required this.title,
    required this.requestedAt,
    this.executedAt,
  });

  bool get isDone => executedAt != null;
}