bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  return emailRegex.hasMatch(email);
}

bool isValidPhone(String phone) {
  final phoneRegex = RegExp(r'^[0-9]{10,15}$');
  return phoneRegex.hasMatch(phone);
}

bool isValidPassword(String password) {
  return password.length >= 8;
}