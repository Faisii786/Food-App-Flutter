import 'package:flutter/material.dart';
import 'package:food_app/splash/splash_servives.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xff3a3e3e),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff3a3e3e),
            Color.fromARGB(255, 22, 22, 22),
          ])
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 280.0,
              height: 280.0,
              child: ClipOval(
                child: Center(child: Image.asset("assets/images/splash.png")),
              ),
            ),
            Expanded(
              child: Center(
                  child: Text(
                'Enjoy Your \n       Food',
                style: GoogleFonts.aladin(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
