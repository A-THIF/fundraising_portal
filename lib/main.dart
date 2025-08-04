import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import screens
import 'screens/splash_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/notification_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Hide status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const FundraisingPortalApp());
}

class FundraisingPortalApp extends StatelessWidget {
  const FundraisingPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'She Can Foundation Intern Portal',
      theme: ThemeData(
        primaryColor: Color(0xFFB22222), // Firebrick
        scaffoldBackgroundColor: Color(0xFFFAFAFA), // Soft white
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/sign_in': (context) => const SignInScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/notifications': (context) => const NotificationScreen(),
      },
    );
  }
}
