String maskEmail({required String email}) {
  final List<String> emailParts = email.split('@');
  if (emailParts[0].length <= 2) {
    return email;
  }
  final String maskedEmail =
      emailParts[0].replaceRange(1, emailParts[0].length - 1, '************');
  return '$maskedEmail@${emailParts[1]}';
}
