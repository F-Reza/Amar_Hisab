import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

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

  void registerUser() async {
    if (mobileController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('মোবাইল নম্বর লিখুন')),
      );
    } else if (mobileController.text.length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('সঠিক মোবাইল নম্বর লিখুন')),
      );
    } else if (emailController.text.length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ইমেইল লিখুন')),
      );
    } else if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('পাসওয়ার্ড লিখুন')),
      );
    } else if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('পাসওয়ার্ড ৬ অক্ষরের বেশি হতে হবে')),
      );
    } else {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20,),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/logo.png', // Use asset image as fallback
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(0.2),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.black38,
                        child: GestureDetector(
                          // onTap: _pickImage,
                          child: Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text('আপনার একাউন্ট তৈরি করুন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
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
                  onPressed: registerUser,
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
              SizedBox(height: 50,),
              SizedBox(
                height: 50,
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
            ],
          ),
        ),
      ),
    );
  }
}
