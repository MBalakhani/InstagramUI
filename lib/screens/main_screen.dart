import 'package:flutter/material.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_content_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  int selecteditem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xff1C1F2E),
              currentIndex: selecteditem,
              onTap: (int index) {
                setState(() {
                  selecteditem = index;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Image.asset('images/icon_active_home.png'),
                  icon: Image.asset('images/icon_home.png'),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_search.png'),
                  label: 'search',
                  activeIcon:
                      Image.asset('images/icon_search_navigation_active.png'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_add_navigation.png'),
                  label: 'add',
                  activeIcon:
                      Image.asset('images/icon_add_navigation_active.png'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_activity_navigation.png'),
                  label: 'activity',
                  activeIcon:
                      Image.asset('images/icon_activity_navigation_active.png'),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/user.png'),
                      ),
                    ),
                  ),
                  label: 'user',
                  activeIcon: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/user.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: selecteditem,
          children: getlayout(),
        ));
  }

  List<Widget> getlayout() {
    return <Widget>[
      homeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      userprofilescreen(),
    ];
  }
}
