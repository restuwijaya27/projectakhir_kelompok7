import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/Product_ayamkampung.dart';
import 'package:project_if22a/event/event_pref.dart';
import 'package:project_if22a/product_ayampotong.dart';
import 'package:project_if22a/logout.dart';
import 'package:project_if22a/screen/admin/home_screen.dart';
import 'package:project_if22a/screen/login.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;
  String _title = '';
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Marketplace1(),
    Marketplace2(),
  ];
  @override
  void initState() {
    super.initState();
    _title = 'default';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        child: AppBar(
          elevation: 2,
          toolbarHeight: 60,
          backgroundColor: Color.fromARGB(255, 255, 254, 254),
          centerTitle: true,
          title: _title == 'default'
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  'Hai, ',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: asset.colorPrimary,
                                  ),
                                ),
                                Text(
                                  'Restu Wijaya',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: asset.colorPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: asset.colorAccent,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundImage:
                              AssetImage('../asset/image/raziz.jpg'),
                          backgroundColor: asset.colorPrimaryDark,
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  _title,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
        ),
        preferredSize: Size.fromHeight(70.0),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Color.fromARGB(150, 255, 159, 159),
          selectedItemColor: asset.colorPrimary,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Ayam Kampung",
              icon: Icon(Icons.shop),
            ),
            BottomNavigationBarItem(
              label: "Ayam Potong",
              icon: Icon(Icons.shop),
            ),
            BottomNavigationBarItem(
              label: "Logout",
              icon: Icon(
                Icons.logout_outlined,
              ),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void onTabTapped(int index) {
    if (index == 3) {
      EventPref.clear();
      Get.off(Login());
    } else {
      setState(() {
        _selectedIndex = index;
        switch (index) {
          case 0:
            {
              _title = 'Home';
            }
            break;
          case 1:
            {
              _title = 'Ayam Kampung';
            }
            break;
          case 2:
            {
              _title = 'Ayam Potong';
            }
            break;
          case 3:
            {
              _title = 'logout';
            }
            break;
        }
      });
    }
  }
}
