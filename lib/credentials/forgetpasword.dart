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
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          elevation: 0.0,
          toolbarHeight: 100,
          title: const Text(
            'Forget Password',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: const Color(0xFF0b2d39),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextField(
                  hintText: 'Enter your email',
                  controller: emailController,
                  obsecureText: false,
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
    );
  }
}
