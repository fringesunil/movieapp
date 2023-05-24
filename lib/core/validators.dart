class Validators {
  String? Function(String?) emailvalidator = (email) {
    RegExp reg =
        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
            r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\'
            r'.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (email!.isEmpty) {
      return "Email is required";
    } else if (!reg.hasMatch(email)) {
      return "Invalid Email Id";
    } else {
      return null;
    }
  };
  String? Function(String?) passwordvalidator = (password) {
    if (password!.isEmpty) {
      return "Password is required";
    } else if (password.length < 6) {
      return "Password must be atleast 6 characters";
    } else {
      return null;
    }
  };
  String? Function(String?) namevalidator = (name) {
    if (name!.isEmpty) {
      return "UserName Is required";
    } else {
      return null;
    }
  };
  String? Function(String?) phonevalidator = (name) {
    if (name!.isEmpty) {
      return "Phone Number Is required";
    } else {
      return null;
    }
  };
}
