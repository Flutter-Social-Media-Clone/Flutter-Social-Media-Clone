dynamic emailValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your email";
  }
  return null;
}

dynamic passwordValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your password";
  } else if (value.length < 4) {
    return "Password must be at least 4 characters";
  }
  return null;
}

dynamic usernameValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your username";
  }
  return null;
}

dynamic genderValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your gender identity";
  }
  return null;
}

dynamic ageValidator(String value) {
  if (value.isEmpty) {
    return "Please enter your age";
  }
  return null;
}
