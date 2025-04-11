import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscureText = true;

  void loginUser() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/logo.png', height: 150, width: 150,),
            ),
            SizedBox(height: 20,),
            Text('আপনার একাউন্ট তৈরি করুন', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  labelText: 'নাম লিখুন',
                  labelStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6),),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 2),
                  ),
                  prefixIcon: Icon(Icons.person, color:const Color(0xFF2f59f6),),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 50,
              child: TextField(
                controller: mobileController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  labelText: ' মোবাইল লিখুন',
                  labelStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6),),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 2),
                  ),
                  prefixIcon: Icon(Icons.phone_android_sharp, color:const Color(0xFF2f59f6),),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 50,
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  labelText: 'ইমেইল লিখুন',
                  labelStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6),),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 2),
                  ),
                  prefixIcon: Icon(Icons.email_outlined, color:const Color(0xFF2f59f6),),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            ),
            SizedBox(height: 15,),
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
                    borderSide: BorderSide(color: const Color(0xFF2f59f6),),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color(0xFF2f59f6), width: 2),
                  ),
                  prefixIcon: Icon(Icons.lock, color: const Color(0xFF2f59f6),),
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
            SizedBox(height: 25, ),
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
                  'নিবন্ধন করুন',
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
      bottomSheet: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'আপনার একাউন্ট আছে? ',
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 13,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print('Register');
              },
              child: Text(
                'লগইন করুন',
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
