
import 'package:flutter/material.dart';

import '../screens/profile_page.dart';

class MainDrawer extends StatefulWidget {
  static const String routeName = '/sidebar';
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.black54,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image.asset('assets/images/logo.png',
                      height: 110, width: 110, fit: BoxFit.cover),
                ),
                const SizedBox(height: 5),
                Text(
                  'Ataur Rahman',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  '01830996044',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  'marahman@gmail.com',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                // Image.asset('assets/images/logo.png', width: 304,height: 170, fit: BoxFit.cover),
              ],
            ),
          ),
          ListTile(
            // onTap: () => Navigator.pushNamed(context, IndexScreen.routeName),
            onTap: () => Navigator.pop(context),
            leading: const Icon(Icons.home,color: Colors.black,),
            title: const Text('হোম',style: TextStyle(color: Colors.black),),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage())),
            leading: const Icon(Icons.co_present_outlined,color: Colors.black,),
            title: const Text('প্রোফাইল',style: TextStyle(color: Colors.black),),
          ),
          Divider(),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'ডাটাবেস ব্যাকআপ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          const ListTile(
            //onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: Icon(Icons.sd_storage_outlined,color: Colors.black,),
            title: Text('লোকাল স্টোরেজ',style: TextStyle(color: Colors.black),),
          ),
          const ListTile(
            //onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: Icon(Icons.add_to_drive_outlined,color: Colors.black,),
            title: Text('গুগল ড্রাইভ',style: TextStyle(color: Colors.black),),
          ),
          Divider(),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'ডাটাবেস রিস্টোর',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          const ListTile(
            //onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: Icon(Icons.sd_storage_outlined,color: Colors.black,),
            title: Text('লোকাল স্টোরেজ',style: TextStyle(color: Colors.black),),
          ),
          const ListTile(
            //onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: Icon(Icons.add_to_drive_outlined,color: Colors.black,),
            title: Text('গুগল ড্রাইভ',style: TextStyle(color: Colors.black),),
          ),
          Divider(),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'ডাটাবেস এক্সপোর্ট',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          const ListTile(
            //onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: Icon(Icons.file_download_rounded,color: Colors.black,),
            title: Text('ডাটাবেস এক্সপোর্ট (CSV)',style: TextStyle(color: Colors.black),),
          ),
          Divider(),
          SizedBox(height: 10,),
          ListTile(
            onTap: () async {
              /*await userProvider.logout();
              Navigator.pushReplacementNamed(context, LauncherPage.routeName);*/
            },
            leading: const Icon(Icons.logout,color: Colors.black,),
            title: const Text('লগ আউট',style: TextStyle(color: Colors.black),),
          ),
          const SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
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
            ],
          ),
        ],
      ),
    );
  }
}
