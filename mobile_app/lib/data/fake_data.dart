import 'package:mobile_app/models/command_request.dart';
import 'package:mobile_app/models/patient.dart';

class FakeData {
  // بيانات حساب المرافق (تجريبية لحد ما نوصل باك إند)
  static const String companionName = 'Hana Mostafa';
  static const String companionEmail = 'hana@example.com';
  static const String companionEmergency = '01012345678';

  static final List<Patient> patients = [
    const Patient(id: 'p1', name: 'Ahmed Ali', age: 67, notes: 'Needs help with water'),
    const Patient(id: 'p2', name: 'Mona Hassan', age: 54, notes: 'Allergic to penicillin'),
    const Patient(id: 'p3', name: 'Omar Khaled', age: 72, notes: 'Sensitive to bright light'),
    const Patient(id: 'p4', name: 'Sara Mahmoud', age: 61, notes: 'Prefers the room quiet at night'),
    const Patient(id: 'p5', name: 'Youssef Adel', age: 48, notes: 'Uses a communication board'),
    const Patient(id: 'p6', name: 'Laila Samir', age: 79, notes: 'Needs repositioning every 2 hours'),
  ];

  static final List<CommandRequest> requests = [
    CommandRequest(
      id: 'r1',
      patientId: 'p1',
      type: CommandType.needs,
      title: 'Water',
      requestedAt: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    CommandRequest(
      id: 'r2',
      patientId: 'p2',
      type: CommandType.emergency,
      title: 'Emergency',
      requestedAt: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    CommandRequest(
      id: 'r3',
      patientId: 'p1',
      type: CommandType.comfort,
      title: 'Adjust pillow',
      requestedAt: DateTime.now().subtract(const Duration(hours: 3)),
      executedAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 50)),
    ),
  ];
}