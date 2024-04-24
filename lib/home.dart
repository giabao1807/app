import 'package:app/icons/app_icons.dart';
import 'package:app/setting.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          
          iconTheme: const IconThemeData(color: Colors.white),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
          title: const Text('Thị trường'),
        ),
        body: Container(
          color: Colors.black,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black54,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            fixedColor: Colors.purpleAccent,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            iconSize: 30,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(AppIcons.home), label: 'Thị trường'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Đặt lệnh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera), label: 'Tài sản'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Cài đặt'),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                switch (index) {
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SettingScreen()), 
                    );
                    break;
                }
              });
            }),
      ),
    );
  }
}
