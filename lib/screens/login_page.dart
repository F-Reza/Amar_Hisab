
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscureText = true;

  void loginUser() async {
    if (mobileController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('মোবাইল নম্বর লিখুন')),
      );
    }
    else if (mobileController.text.length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('সঠিক মোবাইল নম্বর লিখুন')),
      );
    }

    else if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('পাসওয়ার্ড লিখুন')),
      );
    }
    else if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('পাসওয়ার্ড ৬ অক্ষরের বেশি হতে হবে')),
      );
    }
    else {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/logo.png', height: 120, width: 120),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'আপনার একাউন্টে প্রবেশ করুন',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: mobileController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11),
                              ],
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                labelText: 'মোবাইল নম্বর',
                                labelStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color(0xFF2f59f6)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 1.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 2),
                                ),
                                prefixIcon: Icon(Icons.phone_android_sharp, color: const Color(0xFF2f59f6)),
                                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isObscureText,
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                labelText: 'পাসওয়ার্ড লিখুন',
                                labelStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color(0xFF2f59f6)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 1.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 2),
                                ),
                                prefixIcon: Icon(Icons.lock, color: const Color(0xFF2f59f6)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isObscureText ? Icons.visibility_off : Icons.visibility,
                                    color: const Color(0xFF2f59f6),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isObscureText = !isObscureText;
                                    });
                                  },
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              print('Forgotted Password!');
                            },
                            child: Text(
                              'পাসওয়ার্ড ভুলে গেছেন?',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: loginUser,
                          color: const Color(0xFF2f59f6),
                          child: Text(
                            'প্রবেশ করুন',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'আপনার একাউন্ট নেই? ',
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 13,
              ),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('নিবন্ধন প্রক্রিয়া বন্ধ আছে !....')),
                );
                Navigator.pushNamed(context, RegisterPage.routeName);
                print('Register');
              },
              child: Text(
                'নিবন্ধন করুন',
                style: TextStyle(
                  color: const Color(0xFF2f59f6),
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}