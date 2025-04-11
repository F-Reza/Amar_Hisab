
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_page.dart';
import 'screens/launcher_page.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'widgets/main_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PanchoHub',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF2f59f6),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0, // Removes shadow if any
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2f59f6),),
        useMaterial3: true,
      ),

      // initialRoute: LauncherPage.routeName,
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName : (_) => const LoginPage(),
        RegisterPage.routeName : (_) => const RegisterPage(),
        MainDrawer.routeName : (_) => const MainDrawer(),
        HomePage.routeName : (_) => const HomePage(),
      },
    );
  }
}

// backgroundColor: const Color(0xFF2f59f6),