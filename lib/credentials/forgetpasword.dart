import 'package:flutter/material.dart';
import 'package:food_app/credentials/login_screen.dart';
import 'package:food_app/widgets/my_textfield.dart';
import 'package:food_app/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  RegExp reg = RegExp(LoginScreen.pattern.toString());
  GlobalKey<ScaffoldMessengerState> globalkey =
      GlobalKey<ScaffoldMessengerState>();
  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  Future ResetPassword() async {
    if (emailController.text.trim().isEmpty) {
      showSnackbar('email is empty');
      return;
    } else if (!reg.hasMatch(emailController.text)) {
      showSnackbar('Please enter valid email');
      return;
    }
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.toString())
          .then((value) {
        showSnackbar(
            'We have send you email to recover password , Please check your email');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar('Email dost not exist');
        setState(() {
          loading = false;
        });
        return;
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

  void showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    globalkey.currentState?.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: globalkey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0.0,
          toolbarHeight: 80,
          title: const Text(
            'Forget Password',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          //backgroundColor: const Color(0xFF0b2d39),
          backgroundColor: const Color.fromARGB(255, 41, 5, 104),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 500,
            decoration: const BoxDecoration(
                // border: Border.all(),
                // borderRadius: BorderRadius.circular(10)
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/forget.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hintText: 'Enter your email',
                    controller: emailController,
                    obsecureText: false,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                      loading: loading,
                      ontap: () {
                        ResetPassword();
                      },
                      title: 'Forget Password'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
