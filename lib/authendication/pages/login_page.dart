import 'package:flutter/material.dart';
import 'package:movieapp/authendication/pages/signup_page.dart';
import 'package:movieapp/authendication/provider/authendication_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<AuthendicationProvider>(
          builder: (context, auth, child) => Form(
                key: auth.loginKey,
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
                              'Log in to your account',
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
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (auth.loginKey.currentState!.validate()) {
                              auth.login(context);
                            }
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.6,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.2, horizontal: 0.2),
                            decoration: const BoxDecoration(
                              color: Color(0xFF474747),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Center(
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFFFFFFFF)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: size.width * 0.7,
                            height: size.height * 0.10,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const signUp()),
                                      );
                                    },
                                    child: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text: "Doesn't have an account?",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14)),
                                        TextSpan(
                                            text: 'Sign Up',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14)),
                                      ]),
                                    ),
                                  ),
                                ])),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
