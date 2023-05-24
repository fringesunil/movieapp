import 'package:flutter/material.dart';
import 'package:movieapp/authendication/pages/login_page.dart';
import 'package:movieapp/authendication/provider/authendication_provider.dart';
import 'package:provider/provider.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Consumer<AuthendicationProvider>(
      builder: (context, auth, child) => Form(
        key: auth.signupKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.2),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: size.height * 0.08,
                  width: size.width,
                  child: const Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF4C637A),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 0.2),
                  width: size.width * 0.8,
                  child: TextFormField(
                    controller: auth.name,
                    validator: auth.validator.namevalidator,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 0.2),
                  width: size.width * 0.8,
                  child: TextFormField(
                    controller: auth.email,
                    validator: auth.validator.emailvalidator,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 0.2),
                  width: size.width * 0.8,
                  child: TextFormField(
                    controller: auth.password,
                    validator: auth.validator.passwordvalidator,
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 0.2),
                  width: size.width * 0.8,
                  child: TextFormField(
                    controller: auth.phonenumber,
                    validator: auth.validator.phonevalidator,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone_android),
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 0.2),
                    width: size.width * 0.8,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.people_alt),
                      ),
                      value: auth.dropdownValue,
                      items: auth.dropdownList.map((items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          auth.dropdownValue = newValue.toString();
                        });
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (auth.signupKey.currentState!.validate()) {
                      auth.signup(context);
                    }
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.6,
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.2, horizontal: 0.2),
                    decoration: const BoxDecoration(
                      color: Color(0xFF474747),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Center(
                      child: Text(
                        'SIGN UP',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
