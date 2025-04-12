
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/register';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  bool isObscureText = true;

  void registerUser() async {
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ডাটা পরিবর্তন'),
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
              Text('আপনার ডাটা পরিবর্তন করুন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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
                    'আপডেট করুন',
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
                      'পাসওয়ার্ড পরিবর্তন করতে চান? ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _showEditPasswordDialog(context);
                      },
                      child: Text(
                        'ক্লিক করুন',
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

  // Add this method to your widget class
  void _showEditPasswordDialog(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    DateTime selectedDate = DateTime.now();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('পাসওয়ার্ড পরিবর্তন করুন',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: oldPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObscureText,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'বর্তমান পাসওয়ার্ড',
                          labelStyle: TextStyle(fontSize: 13),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'বর্তমান পাসওয়ার্ডটি লিখুন';
                          }
                          if (value.length < 6) {
                            return 'পাসওয়ার্ড ৬ অক্ষরের বেশি হতে হবে';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: newPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObscureText,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'নতুন পাসওয়ার্ড',
                          labelStyle: TextStyle(fontSize: 13),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'নতুন পাসওয়ার্ডটি লিখুন';
                          }
                          if (value.length < 6) {
                            return 'পাসওয়ার্ড ৬ অক্ষরের বেশি হতে হবে';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('বাতিল'),
                ),
                SizedBox(
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final amount = amountController.text;
                        print('Amount: $amount, Date: $selectedDate');
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent
                    ),
                    child: const Text('পরিবর্তন', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

}
