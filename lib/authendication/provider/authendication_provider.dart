import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/authendication/pages/login_page.dart';
import 'package:movieapp/core/common_methods.dart';
import 'package:movieapp/core/validators.dart';
import 'package:movieapp/homepage/page/home_page.dart';
import 'package:movieapp/authendication/repository/auth_repo.dart';

class AuthendicationProvider extends AuthRepository
    with ChangeNotifier, CommonMethods {
  Validators validator = Validators();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  User? user;
  var dropdownValue = "Profession";
  List dropdownList = [
    "Profession",
    "Actor",
    "Director",
    "Editer",
    "Producer",
    "Music Director"
  ];
  clearvalues() {
    email.clear();
    password.clear();
    name.clear();
    phonenumber.clear();
  }

  signup(BuildContext context) async {
    if (loginKey.currentState!.validate()) {
      try {
        showLoaderButton(context, "Please wait....");
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text);
        user = userCredential.user;
        addUser(
            email.text, password.text, name.text, phonenumber.text, user!.uid);

        getSnackbar(context, "Account Sucessfully Created", Colors.green);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
        clearvalues();
      } on FirebaseException catch (e) {
        print(e.message);
        print("signup Failed");
      }
    }
  }

  login(BuildContext context) async {
    if (loginKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } catch (e) {
        print(e);

        getSnackbar(context, "Invalid Credentials", Colors.red);
      }
    }
  }

  addUser(name, email, uid, phone, password) async {
    print("NAME $name");
    print("EMAIL $email");
    print("PASSWORD $password");
    print("PHONE $phone");
    print("UID $uid");
    await adduserDetails({
      "name": name,
      "email_id": email,
      "user_id": uid,
      "phone": phone,
      "password": password
    });
  }
}
