
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePage extends StatefulWidget {
  static const String routeName = '/profile_update';
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController professionController;
  late TextEditingController upazilaController;
  late TextEditingController addressController;

  String? selectedGender;
  String? selectedUpazila;
  XFile? _image;
  String? imgUrlX;

  @override
  void initState() {
    super.initState();
    // final user = Provider.of<UserProvider>(context, listen: false).user;

    nameController = TextEditingController(text: 'user?.name' ?? '');
    phoneController = TextEditingController(text: 'user?.phone' ?? '');
    emailController = TextEditingController(text: 'user?.email' ?? '');
    professionController = TextEditingController(text: 'user?.profession' ?? '');
    upazilaController = TextEditingController(text: 'user?.upazila' ?? '');
    addressController = TextEditingController(text: 'user?.address' ?? '');

  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    professionController.dispose();
    upazilaController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void _updateProfile() async {
    if (!_formKey.currentState!.validate()) {
      return; // Stop if form validation fails
    }

    // Ensure required fields are not null or empty
    if (selectedGender == null || selectedUpazila == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('লিঙ্গ এবং উপজেলা পূরণ করুন')),
      );
      return;
    }

    /*final updatedUser = UserModel(
      name: nameController.text,
      email: emailController.text.isEmpty ? null : emailController.text,
      profession: professionController.text,
      gender: selectedGender!,
      upazila: selectedUpazila!,
      address: addressController.text.isEmpty ? null : addressController.text,
      image: Provider.of<UserProvider>(context, listen: false).user!.image,
      subscription: Provider.of<UserProvider>(context, listen: false).user!.subscription,
      emailVerifiedAt: Provider.of<UserProvider>(context, listen: false).user!.emailVerifiedAt,
      createdAt: Provider.of<UserProvider>(context, listen: false).user!.createdAt,
      updatedAt: DateTime.now().toString(),
    );

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String message = await userProvider.updateProfile(updatedUser);

    if (!mounted) return;

    if (message.contains("Successful")) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('সফলভাবে আপডেট হয়েছে।')),
      );
      Navigator.pop(context) ;

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      return;
    }*/


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Profile")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/logo.png', // Use asset image as fallback
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
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
                SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: nameController,/**/
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'আপনার নাম*',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      prefixIcon: Icon(Icons.person_outline, color: Colors.blue),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'আপনার নাম লিখুন'; // Name is required
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'মোবাইল নাম্বার* (পরিবর্তন করা যাবে না)',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      prefixIcon: Icon(Icons.phone_android_sharp, color: Colors.blue),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    readOnly: true, // Prevent editing
                    enableInteractiveSelection: false, // Disable text selection
                    focusNode: AlwaysDisabledFocusNode(), // Disable focus
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'ইমেইল',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.blue),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: professionController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'আপনার পেশা*',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      prefixIcon: Icon(Icons.work_outline, color: Colors.blue),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'আপনার পেশা লিখুন'; // Profession is required
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text("লিঙ্গ:*", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(width: 5),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: "পুরুষ",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          Text("পুরুষ"),
                          Radio<String>(
                            value: "মহিলা",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          Text("মহিলা"),
                          Radio<String>(
                            value: "অন্যান্য",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          Text("অন্যান্য"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: 50,
                  child: DropdownButtonFormField<String>(
                    value: selectedUpazila,
                    decoration: InputDecoration(
                      labelText: 'উপজেলা*',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      prefixIcon: Icon(Icons.location_city, color: Colors.blue),
                    ),
                    items: [
                      "তেঁতুলিয়া",
                      "পঞ্চগড় সদর",
                      "আটোয়ারী",
                      "বোদা",
                      "দেবীগঞ্জ",
                    ].map((String upazila) {
                      return DropdownMenuItem<String>(
                        value: upazila,
                        child: Center(child: Text(upazila, textAlign: TextAlign.center)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedUpazila = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'উপজেলা নির্বাচন করুন'; // Upazila is required
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  child: TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'আপনার ঠিকানা',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    maxLines: null,
                    minLines: 2,
                    textInputAction: TextInputAction.newline,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: _updateProfile,
                    color: Colors.blue,
                    child: Text(
                      'আপডেট করুন',
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
  }

  /*Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'svg'],
    );

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;

      if (_isValidImage(filePath)) {
        setState(() {
          _image = XFile(filePath);
        });
      } else {
        _showError("Only JPG, JPEG, PNG, GIF, or SVG files are allowed.");
      }
    }
  }*/

  /// Function to validate image file type
  bool _isValidImage(String path) {
    final List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'svg'];
    String extension = path.split('.').last.toLowerCase();
    return allowedExtensions.contains(extension);
  }

  /// Show error message as Snackbar
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}