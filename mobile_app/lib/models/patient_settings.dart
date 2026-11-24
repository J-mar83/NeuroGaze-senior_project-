class PatientSettings {
  final int dwellSeconds; // مدة التثبيت العادية
  final int emergencyDwellSeconds; // مدة تثبيت الطوارئ (أطول)

  const PatientSettings({
    this.dwellSeconds = 2,
    this.emergencyDwellSeconds = 3,
  });

  Duration get dwell => Duration(seconds: dwellSeconds);
  Duration get emergencyDwell => Duration(seconds: emergencyDwellSeconds);
}