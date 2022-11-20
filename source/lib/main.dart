import 'dart:async';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sheinshop/screen/AccessScreen.dart';
import 'package:sheinshop/screen/CategoryScreen.dart';
import 'package:sheinshop/screen/HomeScreen.dart';
import 'package:sheinshop/screen/ProfileScreen.dart';



void setupLocator(){

}
void main() {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Flutter',
        theme: ThemeData(
          primarySwatch:Colors.green,
        ),
        home: AccessScreen(),
        //home:SettingScreen(),
        //home: MyApp(),
        builder: EasyLoading.init(),
        getPages: [
        GetPage(
        name: '/login',
        page: () => AccessScreen(),
        ),]
      ));
  configLoading();
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 1000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Color(0xFFEEEEEE)
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController _pageController;
  int _selectedPage = 0;
  Timer? _timer;
  late double _progress;
  List<Widget> pages = [
    HomeScreen(),
    CategoryPage(),
    ProfileScreen(),
    //ProfileView(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(()   {

          _selectedPage = index; }),
        controller: _pageController,
        children: [
          ...pages
        ],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedPage,
        showElevation: false,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home_outlined, size: 23),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.shopping_cart_outlined, size: 23),
            title: Text('Shop'),
          ),
          // FlashyTabBarItem(
          //   icon: Icon(Icons.shopping_bag_outlined, size: 23),
          //   title: Text('Cart'),
          // ),
          FlashyTabBarItem(
            icon: Icon(Icons.account_circle_outlined, size: 23,),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: HomePageView(),
//       builder: EasyLoading.init(),
//     );
//   }
// }