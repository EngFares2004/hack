class Validation {
  static String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.length != 11) {
      return 'Phone number must contain 11 digits.';
    }
    return null;
  }

  static String? validateUsername(String username) {
    if (username.length <= 3) {
      return 'Username must contain more than 3 characters.';
    }
    return null;
  }

  static String? validatePasswordMatch(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return 'Password and Confirm Password do not match.';
    }
    return null;
  }

  static String? validateEmail(String email) {
    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validateTermsAccepted(bool isAccepted) {
    if (!isAccepted) {
      return 'Please accept the terms and conditions.';
    }
    return null;
  }
}
