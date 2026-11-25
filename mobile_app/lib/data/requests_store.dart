import 'package:flutter/foundation.dart';
import 'package:mobile_app/data/fake_data.dart';
import 'package:mobile_app/models/command_request.dart';

class RequestsStore extends ChangeNotifier {
  RequestsStore._(); // constructor خاص: محدش يعمل نسخة تانية
  static final RequestsStore instance = RequestsStore._(); // النسخة الوحيدة

  final List<CommandRequest> _requests = List.of(FakeData.requests);

  /// الطلبات المعلقة: الطوارئ فوق، وبعدها الأحدث
  List<CommandRequest> get pending {
    final list = _requests.where((r) => !r.isDone).toList();
    list.sort((a, b) {
      final aRank = a.type == CommandType.emergency ? 0 : 1;
      final bRank = b.type == CommandType.emergency ? 0 : 1;
      if (aRank != bRank) return aRank.compareTo(bRank);
      return b.requestedAt.compareTo(a.requestedAt);
    });
    return list;
  }

  /// الطلبات المنفذة: الأحدث تنفيذاً الأول
  List<CommandRequest> get done {
    final list = _requests.where((r) => r.isDone).toList();
    list.sort((a, b) => b.executedAt!.compareTo(a.executedAt!));
    return list;
  }

  /// كل طلبات مريض معين: الأحدث الأول
  List<CommandRequest> forPatient(String patientId) {
    final list = _requests.where((r) => r.patientId == patientId).toList();
    list.sort((a, b) => b.requestedAt.compareTo(a.requestedAt));
    return list;
  }

  int pendingCountFor(String patientId) =>
      _requests.where((r) => r.patientId == patientId && !r.isDone).length;

  String patientNameOf(String patientId) =>
      FakeData.patients.firstWhere((p) => p.id == patientId).name;

  CommandRequest requestById(String id) =>
      _requests.firstWhere((r) => r.id == id);

  /// المريض اختار أمر: بنضيف طلب جديد (بيظهر عند المرافق في Activity)
  void addRequest({
    required String patientId,
    required CommandType type,
    required String title,
  }) {
    _requests.add(
      CommandRequest(
        id: 'r${DateTime.now().microsecondsSinceEpoch}',
        patientId: patientId,
        type: type,
        title: title,
        requestedAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  /// بيتنادى لما تدوس ✔
  void markDone(String requestId) {
    final request = _requests.firstWhere((r) => r.id == requestId);
    request.executedAt = DateTime.now();
    notifyListeners(); // ← أهم سطر: بيبلّغ كل الشاشات
  }
}