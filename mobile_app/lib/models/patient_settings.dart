class PatientSettings {
  final int dwellSeconds; // مدة التثبيت العادية
  final int emergencyDwellSeconds; // مدة تثبيت الطوارئ (أطول)
  final int emergencyCancelSeconds; // مهلة إلغاء الطوارئ بعد التفعيل

  const PatientSettings({
    this.dwellSeconds = 2,
    this.emergencyDwellSeconds = 3,
    this.emergencyCancelSeconds = 5,
  });

  /// مهلة الإلغاء الفعلية: لازم تكون أطول من مدة التثبيت بـ 3 ثواني على الأقل،
  /// عشان المريض يقدر يلغي بالنظر مهما كانت مدة التثبيت اللي المرافق ضابطها
  int get effectiveCancelSeconds => emergencyCancelSeconds > dwellSeconds + 3
      ? emergencyCancelSeconds
      : dwellSeconds + 3;

  Duration get dwell => Duration(seconds: dwellSeconds);
  Duration get emergencyDwell => Duration(seconds: emergencyDwellSeconds);
}