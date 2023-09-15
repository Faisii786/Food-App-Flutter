import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/provider/my_provider.dart';
import 'package:food_app/splash/splash_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food APP',
        theme: ThemeData(
          dividerColor: Colors.black,
          useMaterial3: true,
          primaryColor: const Color(0xFFBCD438),
        ),
        //home: const SplashScreen(),
        home: SplashScreen(),
      ),
    );
  }
}
