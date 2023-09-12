import 'package:flutter/material.dart';
import 'package:food_app/splash/splash_servives.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices=SplashServices();
  @override
  void initState() {
    
    super.initState();
    splashServices.islogin(context);
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: const Color(0xff3a3e3e),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100,),
          SizedBox(
          width: 200.0, // Adjust the width and height as needed
          height: 200.0,
          child: ClipOval(
            child: Center(
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPTru2KF5ldag6dB2PvI4NvatpzDBOkzkZF1UnCCu-V_bTIapOo8eeNnQwTsCRER9O51o&usqp=CAU'),
            ),
          ),
          ),
            Expanded(child:  Center(child: Text('Enjoy Your \n       Food',style: GoogleFonts.aladin(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),)),)

          ],
        ),
      ),
    );
  }
}

