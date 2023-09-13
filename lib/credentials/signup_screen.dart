// ignore_for_file: unnecessary_null_comparison, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/credentials/login_screen.dart';
import 'package:food_app/widgets/round_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/my_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late UserCredential userCredential;
  RegExp reg = RegExp(SignupScreen.pattern.toString());
  Color mycolor = const Color(0xFF0b2d39);
  Color buttoncolor = const Color(0xFFBCD438);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  bool loading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  GlobalKey<ScaffoldMessengerState> globalkey =
      GlobalKey<ScaffoldMessengerState>();

  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      showSnackbar('First name is empty');

      return;
    }
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      showSnackbar('Last name is empty');

      return;
    }
    if (emailController.text.trim().isEmpty || lastName.text.trim() == null) {
      showSnackbar('Email is empty');
      return;
    } else if (!reg.hasMatch(emailController.text)) {
      showSnackbar('please enter a valid email');
      return;
    }
    if (passwordController.text.trim().isEmpty ||
        lastName.text.trim() == null) {
      showSnackbar('password is empty');
      return;
    } else {
      setState(() {
        loading = true;
      });
      register();
    }
  }

  void showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );

    globalkey.currentState?.showSnackBar(snackbar);
  }

  Future register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user?.uid)
          .set({
        'firstName': firstName.text,
        'lastName': lastName.text,
        'email': emailController.text,
        'userid': userCredential.user?.uid,
        'password': passwordController.text,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        showSnackbar('the password is weak');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar('email is aleady in use');
      }
    } catch (e) {
      showSnackbar(e.toString());
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: globalkey,
        child: Scaffold(
          backgroundColor: mycolor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'create your account',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Form(
                              child: Column(
                            children: [
                              MyTextField(
                                hintText: 'Enter your first Name',
                                controller: firstName,
                                obsecureText: false,
                                prefixIcon: Icon(Icons.person),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MyTextField(
                                prefixIcon: Icon(Icons.person),
                                  obsecureText: false,
                                  hintText: 'enter your last name',
                                  controller: lastName),
                              const SizedBox(
                                height: 20,
                              ),
                              MyTextField(
                                prefixIcon: Icon(Icons.person),
                                controller: emailController,
                                obsecureText: false,
                                hintText: 'enter your email',
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              MyTextField(
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Enter your password',
                                controller: passwordController,
                                obsecureText: true,
                              ),

                              const SizedBox(
                                height: 35,
                              ),
                              
                              Column(
                                children: [
                                  RoundButton(
                                    title: 'Register',
                                    loading: loading,
                                    ontap: () {
                                      validation();
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already  have an account?",
                                    style: GoogleFonts.aladin(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                      },
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.aladin(
                                            fontSize: 25, color: buttoncolor),
                                      )),
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
