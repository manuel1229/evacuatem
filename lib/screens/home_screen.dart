import 'package:evacuatem/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../my_drawer_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("E-vacuate"),
      ),
      body: Container(
        child: Center(
          child: Text("Homepage"),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Overview", Icons.dashboard_outlined,
          currentPage == DrawerSections.dashboard ? true : false),
           menuItem(2, "Sample1", Icons.dashboard_outlined,
          currentPage == DrawerSections.sample1 ? true : false),
           menuItem(3, "Sample2", Icons.dashboard_outlined,
          currentPage == DrawerSections.sample2 ? true : false),
           menuItem(4, "About us", Icons.dashboard_outlined,
          currentPage == DrawerSections.aboutus ? true : false),
          menuItem(5, "Logout", Icons.dashboard_outlined,
          currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(

      color: selected ? Colors.grey[300] : Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1){
                currentPage = DrawerSections.dashboard;
              }else if (id == 2){
                currentPage = DrawerSections.sample1;
              }else if (id == 3){
                currentPage = DrawerSections.sample2;
              }else if (id == 4){
                currentPage = DrawerSections.aboutus;
              }else if (id == 5){
               FirebaseAuth.instance.signOut().then((value){
            print("Signed Out");
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInScreen()));
          });
          }
            });
          },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  sample1,
  sample2,
  aboutus,
  logout,
}
