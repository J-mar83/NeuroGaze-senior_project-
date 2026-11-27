// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "splashScreen": {
    "description_app": "نظام ذكي لمراقبة التركيز",
    "syncing": "جارٍ مزامنة إشاراتك",
    "language": "تغيير اللغة",
    "mode": "تغيير الوضع"
  },
  "chooseScreen": {
    "patient": "المريض",
    "companion": "المرافق"
  },
  "loginScreen": {
    "welcome": "مرحبًا بعودتك",
    "descriptionlogin": "سجّل الدخول للمتابعة (المرافق)",
    "descriptionPatient": "سجّل الدخول للمتابعة (المريض)",
    "descriptionCompanion": "سجّل الدخول للمتابعة (المرافق)",
    "hintemail": "أدخل البريد الإلكتروني",
    "hintpassword": "أدخل كلمة المرور",
    "invalidemail": "البريد الإلكتروني غير صالح",
    "inavlidpass": "يجب ألا تقل كلمة المرور عن 6 أحرف",
    "textforget": "هل نسيت كلمة المرور؟",
    "buttonlogin": "تسجيل الدخول",
    "or": "أو",
    "buttongoogle": "المتابعة باستخدام Google",
    "askaccount": "ليس لديك حساب؟",
    "createaccount": "إنشاء حساب"
  },
  "registerScreen": {
    "createaccount": "إنشاء حساب",
    "descriptionregister": "حساب المرافق",
    "descriptionPatient": "حساب المريض",
    "descriptionCompanion": "حساب المرافق",
    "invalidname": "من فضلك أدخل اسمك",
    "passwordsDontMatch": "كلمتا المرور غير متطابقتين",
    "name": "الاسم بالكامل",
    "hintemail": "أدخل البريد الإلكتروني",
    "hintpassword": "أدخل كلمة المرور",
    "hintconfirmpass": "تأكيد كلمة المرور",
    "invalidemail": "البريد الإلكتروني غير صالح",
    "inavlidpass": "يجب ألا تقل كلمة المرور عن 6 أحرف",
    "invalidnum": "يجب ألا يقل الرقم عن 12 رقمًا",
    "hintemergency": "رقم الطوارئ",
    "askaccount": "لديك حساب بالفعل؟",
    "signin": "تسجيل الدخول",
    "register": "إنشاء حساب"
  },
  "basicCommandsScreen": {
    "titleOfPage": "انظر إلى البطاقة لفتحها",
    "needsCommand": "الاحتياجات",
    "careCommand": "الرعاية",
    "comfortCommand": "الراحة",
    "talkCommand": "التحدث",
    "emergencyCommand": "الطوارئ"
  },
  "companion": {
    "navPatients": "المرضى",
    "navActivity": "النشاط",
    "navHistory": "السجل",
    "navSettings": "الإعدادات",
    "searchPatients": "ابحث عن مريض",
    "noPatients": "لا يوجد مرضى",
    "yearsOld": "{} سنة",
    "pending": "قيد الانتظار",
    "done": "تم التنفيذ",
    "requestedAt": "طُلب {}",
    "doneAt": "نُفّذ {}",
    "notes": "ملاحظات",
    "activityLog": "سجل النشاط",
    "noActivityYet": "لا يوجد نشاط بعد",
    "pendingCount": "{} قيد الانتظار",
    "allCaughtUp": "لا توجد طلبات معلقة",
    "completedCount": "{} مكتمل",
    "noHistoryYet": "لا يوجد سجل بعد",
    "requestDetails": "تفاصيل الطلب",
    "patient": "المريض",
    "requested": "وقت الطلب",
    "executed": "وقت التنفيذ",
    "notYet": "لم يُنفّذ بعد",
    "responseTime": "زمن الاستجابة",
    "lessThanMinute": "أقل من دقيقة",
    "minutes": "{} دقيقة",
    "hoursMinutes": "{} ساعة و{} دقيقة",
    "markAsDone": "تحديد كمنفّذ",
    "role": "مرافق",
    "email": "البريد الإلكتروني",
    "emergencyNumber": "رقم الطوارئ",
    "darkMode": "الوضع الداكن",
    "language": "اللغة",
    "logout": "تسجيل الخروج",
    "logoutQuestion": "تسجيل الخروج؟",
    "logoutMessage": "ستعود إلى شاشة البداية.",
    "cancel": "إلغاء"
  },
  "commands": {
    "water": "ماء",
    "food": "طعام",
    "toilet": "دورة المياه",
    "air": "هواء نقي",
    "medicine": "الدواء",
    "pain": "أشعر بألم",
    "nurse": "استدعاء الممرضة",
    "doctor": "استدعاء الطبيب",
    "pillow": "تعديل الوسادة",
    "blanket": "بطانية",
    "light": "الإضاءة",
    "temperature": "درجة الحرارة",
    "yes": "نعم",
    "no": "لا",
    "thanks": "شكراً",
    "family": "اتصل بعائلتي"
  },
  "patientScreen": {
    "previous": "السابق",
    "next": "التالي",
    "back": "رجوع",
    "sent": "تم الإرسال إلى المرافق",
    "noCommands": "لا توجد أوامر هنا بعد",
    "emergencyCountdown": "جاري إرسال نداء الطوارئ خلال",
    "cancel": "إلغاء",
    "emergencyCancelled": "تم إلغاء الطوارئ"
  },
  "passSuccess": {
    "change": " تغيير كلمة المرور!",
    "DescriptionChange": "تم تغيير كلمة المرور بنجاح.",
    "button": "العودة إلى تسجيل الدخول"
  },
  "forgetPass": {
    "title": "نسيت كلمة المرور؟",
    "descriptionForget": "لا تقلق! يحدث ذلك. يُرجى إدخال البريد الإلكتروني المرتبط بحسابك.",
    "labelForget": "أدخل بريدك الإلكتروني",
    "buttonForget": "إرسال الرمز"
  },
  "otp": {
    "title": "التحقق من الرمز",
    "descriptionOtp": "أدخل رمز التحقق الذي أرسلناه للتو إلى بريدك الإلكتروني.",
    "buttonOtp": "تحقق",
    "askCode": "لم يصلك الرمز؟",
    "resend": "إعادة الإرسال"
  },
  "NewPass": {
    "title": "إنشاء كلمة مرور جديدة",
    "descriptionNew": "يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمات المرور التي استخدمتها سابقًا.",
    "labelNewPass": "كلمة المرور الجديدة",
    "labelComfirm": "تأكيد كلمة المرور",
    "buttonNew": "إعادة تعيين كلمة المرور",
    "notMatch": "كلمتا المرور غير متطابقتين!"
  }
};
static const Map<String,dynamic> _en = {
  "splashScreen": {
    "description_app": "AI focus monitoring system",
    "syncing": "SYNCING YOUR SIGNALS",
    "language": "Change language",
    "mode": "Change mode"
  },
  "chooseScreen": {
    "patient": "Patient",
    "companion": "Companion"
  },
  "loginScreen": {
    "welcome": "Welcome Back",
    "descriptionlogin": "Sign in to continue (caregiver)",
    "descriptionPatient": "Sign in to continue (Patient)",
    "descriptionCompanion": "Sign in to continue (Companion)",
    "hintemail": "Enter your email",
    "hintpassword": "Enter your password",
    "invalidemail": "Invalid email",
    "inavlidpass": "Min 6 characters",
    "textforget": "Forget password ?",
    "buttonlogin": "Sign In",
    "or": "OR",
    "buttongoogle": "Continue with Google",
    "askaccount": "Don't have an account?",
    "createaccount": "Create Account"
  },
  "registerScreen": {
    "createaccount": "Create Account",
    "descriptionregister": "Caregiver account",
    "descriptionPatient": "Patient account",
    "descriptionCompanion": "Companion account",
    "invalidname": "Please enter your name",
    "passwordsDontMatch": "Passwords do not match",
    "name": "Full Name",
    "hintemail": "Enter your email",
    "hintpassword": "Enter your password",
    "hintconfirmpass": "Confirm Password",
    "invalidemail": "Invalid email",
    "inavlidpass": "Min 6 characters",
    "invalidnum": "Min 12 characters",
    "hintemergency": "Emergency number",
    "askaccount": "Have an account?",
    "signin": "Login",
    "register": "Sign Up"
  },
  "basicCommandsScreen": {
    "titleOfPage": "look at a card to open it",
    "needsCommand": "Needs",
    "careCommand": "Care",
    "comfortCommand": "Comfort",
    "talkCommand": "Talk",
    "emergencyCommand": "Emergency"
  },
  "companion": {
    "navPatients": "Patients",
    "navActivity": "Activity",
    "navHistory": "History",
    "navSettings": "Settings",
    "searchPatients": "Search patients",
    "noPatients": "No patients found",
    "yearsOld": "{} years",
    "pending": "Pending",
    "done": "Done",
    "requestedAt": "Requested {}",
    "doneAt": "Done {}",
    "notes": "Notes",
    "activityLog": "Activity log",
    "noActivityYet": "No activity yet",
    "pendingCount": "{} pending",
    "allCaughtUp": "All caught up",
    "completedCount": "{} completed",
    "noHistoryYet": "No history yet",
    "requestDetails": "Request details",
    "patient": "Patient",
    "requested": "Requested",
    "executed": "Executed",
    "notYet": "Not yet",
    "responseTime": "Response time",
    "lessThanMinute": "Less than a minute",
    "minutes": "{} min",
    "hoursMinutes": "{} h {} min",
    "markAsDone": "Mark as done",
    "role": "Companion",
    "email": "Email",
    "emergencyNumber": "Emergency number",
    "darkMode": "Dark mode",
    "language": "Language",
    "logout": "Log out",
    "logoutQuestion": "Log out?",
    "logoutMessage": "You will return to the start screen.",
    "cancel": "Cancel"
  },
  "commands": {
    "water": "Water",
    "food": "Food",
    "toilet": "Toilet",
    "air": "Fresh air",
    "medicine": "Medicine",
    "pain": "I'm in pain",
    "nurse": "Call the nurse",
    "doctor": "Call the doctor",
    "pillow": "Adjust pillow",
    "blanket": "Blanket",
    "light": "Light",
    "temperature": "Temperature",
    "yes": "Yes",
    "no": "No",
    "thanks": "Thank you",
    "family": "Call my family"
  },
  "patientScreen": {
    "previous": "Previous",
    "next": "Next",
    "back": "Back",
    "sent": "Sent to your companion",
    "noCommands": "No commands here yet",
    "emergencyCountdown": "Sending emergency alert in",
    "cancel": "Cancel",
    "emergencyCancelled": "Emergency cancelled"
  },
  "passSuccess": {
    "change": "Password Changed!",
    "DescriptionChange": "Your password has been changed successfully.",
    "button": "Back to Login"
  },
  "forgetPass": {
    "title": "Forgot Password?",
    "descriptionForget": "Don't worry! It occurs. Please enter the email address linked with your account.",
    "labelForget": "Enter your email",
    "buttonForget": "Send Code"
  },
  "otp": {
    "title": "OTP Verification",
    "descriptionOtp": "Enter the verification code we just sent on your email address.",
    "buttonOtp": "Verify",
    "askCode": "Didn’t received code?",
    "resend": "Resend"
  },
  "NewPass": {
    "title": "Create new password",
    "descriptionNew": "Your new password must be unique from those previously used.",
    "labelNewPass": "New Password",
    "labelComfirm": "Confirm Password",
    "buttonNew": "Reset Password",
    "notMatch": "This password not match!!! "
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
