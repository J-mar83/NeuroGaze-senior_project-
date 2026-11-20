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
    "register":"إنشاء حساب"
  },
  "basicCommandsScreen": {
    "titleOfPage": "انظر إلى البطاقة لفتحها",
    "needsCommand": "الاحتياجات",
    "careCommand": "الرعاية",
    "comfortCommand": "الراحة",
    "talkCommand": "التحدث",
    "emergencyCommand": "الطوارئ"
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
    "register":"Sign Up"
  },
  "basicCommandsScreen": {
    "titleOfPage": "look at a card to open it",
    "needsCommand": "Needs",
    "careCommand": "Care",
    "comfortCommand": "Comfort",
    "talkCommand": "Talk",
    "emergencyCommand": "Emergency"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
