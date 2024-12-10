class ValidationUtils {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال البريد الإلكتروني';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'الرجاء إدخال بريد إلكتروني صحيح';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    // تحقق من أن الرقم يبدأ بـ 77 ويحتوي على 9 أرقام فقط
    final phoneRegex = RegExp(r'^77[0-9]{7}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'الرجاء إدخال رقم هاتف صحيح يبدأ بـ 77 ويتكون من 9 أرقام';
    }
    return null;
  }

  static String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'لا يمكن ترك هذا الحقل فارغاً';
    }
    final textRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
    if (!textRegex.hasMatch(value)) {
      return 'الرجاء إدخال نص باللغة العربية فقط';
    }
    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم';
    }
    if (int.tryParse(value) == null) {
      return 'الرجاء إدخال رقم صحيح';
    }
    return null;
  }
}
