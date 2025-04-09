
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
            leading: const Icon(Icons.home,color: Colors.black,),
            title: const Text('হোম',style: TextStyle(color: Colors.black),),
          ),
          const ListTile(
            //onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: Icon(Icons.history,color: Colors.black,),
            title: Text('হিস্ট্রি',style: TextStyle(color: Colors.black),),
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
