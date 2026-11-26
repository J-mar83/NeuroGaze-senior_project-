class Patient {
  final String id;
  final String name;
  final int age;
  final String notes;
  final String linkCode; // كود الربط مع المرافق

  const Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.notes,
    required this.linkCode,
  });
}