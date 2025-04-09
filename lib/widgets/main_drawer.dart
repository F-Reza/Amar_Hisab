
import 'package:flutter/material.dart';

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
            height: 176,
            color: Colors.grey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image.asset('assets/images/logo.png',
                      height: 110, width: 110, fit: BoxFit.cover),
                ),*/
                Image.asset('assets/images/logo.png', width: 304,height: 170, fit: BoxFit.cover),
              ],
            ),
          ),
          ListTile(
            // onTap: () => Navigator.pushNamed(context, IndexScreen.routeName),
            leading: const Icon(Icons.home,color: Colors.black,),
            title: const Text('হোম',style: TextStyle(color: Colors.black),),
          ),
          const ListTile(
            //onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: Icon(Icons.contact_phone,color: Colors.black,),
            title: Text('যোগাযোগ',style: TextStyle(color: Colors.black),),
          ),
          ListTile(
            //onTap: () => Navigator.pushNamed(context, CreatePDFScreen.routeName,),
            //onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => const CreatePDFScreen(index: 1,))),
            leading: const Icon(Icons.notifications_active,color: Colors.black,),
            title: const Text('নোটিফিকেশন',style: TextStyle(color: Colors.black),),
          ),
          ListTile(
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(builder:(context) => const CreatePDFScreen(index: 1,)));
            },
            leading: const Icon(Icons.perm_contact_cal_rounded,color: Colors.black,),
            title: const Text('প্রোফাইল',style: TextStyle(color: Colors.black),),
          ),
          Divider(height: 1,),
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 16),
            child: Text('যুক্ত হোন',style: TextStyle(fontSize: 20,color: Colors.black),),
          ),
          ListTile(
            //onTap: () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
            leading: const Icon(Icons.facebook,color: Colors.black,),
            title: const Text('ফেসবুক পেজ',style: TextStyle(color: Colors.black),),
          ),
          const ListTile(
            //onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: Icon(Icons.groups,color: Colors.black,),
            title: Text('ফেসবুক গ্রুপ',style: TextStyle(color: Colors.black),),
          ),
          ListTile(
            //onTap: () => Navigator.pushNamed(context, CreatePDFScreen.routeName,),
            //onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => const CreatePDFScreen(index: 1,))),
            leading: const Icon(Icons.yard_outlined,color: Colors.black,),
            title: const Text('ইউটিউব',style: TextStyle(color: Colors.black),),
          ),
          ListTile(
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(builder:(context) => const CreatePDFScreen(index: 1,)));
            },
            leading: const Icon(Icons.email_rounded,color: Colors.black,),
            title: const Text('ইমেইল',style: TextStyle(color: Colors.black),),
          ),
          Divider(height: 1,),
          SizedBox(height: 10,),
          ListTile(
            onTap: () async {
              /*await userProvider.logout();
              Navigator.pushReplacementNamed(context, LauncherPage.routeName);*/
            },
            leading: const Icon(Icons.logout,color: Colors.black,),
            title: const Text('লগ আউট',style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }
}
