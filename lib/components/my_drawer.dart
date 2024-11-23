import 'package:chat_system/Service/auth/auth_service.dart';
import 'package:chat_system/page/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout()
  {
    final auth =AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.messenger_outline,
                    size: 80,
                    color: Colors.amber,
                  ),
                ),
              ),
              // Home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title:const Text("H O M E"),
                  leading:const Icon(Icons.home_filled),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              // Settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading:const Icon(Icons.settings),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);
                    // Navigate to setting page
                    Navigator.push(
                      context,MaterialPageRoute(builder:(context)=>const SettingsPage(),),
                    );
                  },
                ),
              ),
            ],
          ),
          // Logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading:const Icon(Icons.logout_sharp),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
