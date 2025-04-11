import 'package:flutter/material.dart';

import '../providers/service_provider.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    final ServiceProvider provider = ServiceProvider();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("ব্যক্তিগত তথ্য"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfilePage()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            Expanded(
              flex: 7,
              child: Card(
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    image: DecorationImage(opacity: 0.4,
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/logo.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                              /*child: 'userProvider.user!.image' == null
                                  ? Image.asset('assets/images/logo.png', height: 100, width: 100)
                                  : InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ImagePopup(
                                        imageUrl: 'imgUrl/users/${'userProvider.user!.image!'}',
                                      );
                                    },
                                  );
                                },
                                child: Image.network('imgUrl/users/${'userProvider.user!.image!'}', height: 100, width: 100, fit: BoxFit.fill),
                              ),*/
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'নাম: ${'userProvider.user!.name'}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        _buildInfoRow('পেশা', 'userProvider.user!.profession'),
                        _buildInfoRow('লিঙ্গ', 'userProvider.user!.gender'),
                        _buildInfoRow('মোবাইল', 'userProvider.user!.phone'),
                        _buildInfoRow('ই-মেইল', 'userProvider.user!.email' ?? 'N/A'),
                        _buildInfoRow('উপজেলা', 'userProvider.user!.upazila' ?? 'N/A'),
                        _buildInfoRow('ঠিকানা', 'userProvider.user!.address' ?? 'N/A'),
                        _buildInfoRow('সাবস্ক্রিপশন', 'userProvider.user!.subscription' ?? 'N/A'),
                        _buildInfoRow('স্ট্যাটাস', 'userProvider.user!.status.toString()'),
                        _buildInfoRow('তৈরি করা হয়েছে', 'formattedDate'),
                        _buildInfoRow('সর্বশেষ আপডেট', 'formattedDateX'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Card(
                  elevation: 3,
                  color: Colors.white,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Developed by Forhad Reza',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Text(
                          'Version 1.0.0',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            provider.webLink('www.facebook.com/NextDigitOfficial/');
                          },
                          child: RichText(
                            // textAlign: TextAlign.start,
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: 'Powered by ',
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'নেক্সট ডিজিট',
                                  style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Helper widget for better readability
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text('$title: $value', style: TextStyle(fontSize: 16)),
    );
  }
}


class ImagePopup extends StatelessWidget {
  final String imageUrl;

  const ImagePopup({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: 325,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
